import { describe, it, expect, vi } from 'vitest';
import { getPastTime } from './time-travel';

describe('getPastTime', () => {
  it('should return the current time minus 13 hours in the format YY/MM/DD HH:MM:SS', () => {
    // Mock the current date to a fixed point in time
    const mockDate = new Date('2026-01-30T15:00:00Z'); // January 30, 2026, 3 PM UTC
    vi.setSystemTime(mockDate);

    const expectedDate = new Date(mockDate);
    expectedDate.setHours(expectedDate.getHours() - 13); // Should be 2026-01-30T02:00:00Z

    const year = expectedDate.getFullYear().toString().slice(-2);
    const month = (expectedDate.getMonth() + 1).toString().padStart(2, '0');
    const day = expectedDate.getDate().toString().padStart(2, '0');
    const hours = expectedDate.getHours().toString().padStart(2, '0');
    const minutes = expectedDate.getMinutes().toString().padStart(2, '0');
    const seconds = expectedDate.getSeconds().toString().padStart(2, '0');

    const expectedFormattedTime = `${year}/${month}/${day} ${hours}:${minutes}:${seconds}`;

    expect(getPastTime()).toBe(expectedFormattedTime);

    vi.useRealTimers(); // Restore real timers
  });

  it('should handle date transitions correctly (e.g., crossing midnight)', () => {
    // Mock the current date to a time near midnight
    const mockDate = new Date('2026-01-01T05:00:00Z'); // Jan 1, 2026, 5 AM UTC
    vi.setSystemTime(mockDate);

    const expectedDate = new Date(mockDate);
    expectedDate.setHours(expectedDate.getHours() - 13); // Should be 2025-12-31T16:00:00Z

    const year = expectedDate.getFullYear().toString().slice(-2); // 25
    const month = (expectedDate.getMonth() + 1).toString().padStart(2, '0'); // 12
    const day = expectedDate.getDate().toString().padStart(2, '0'); // 31
    const hours = expectedDate.getHours().toString().padStart(2, '0'); // 16
    const minutes = expectedDate.getMinutes().toString().padStart(2, '0'); // 00
    const seconds = expectedDate.getSeconds().toString().padStart(2, '0'); // 00

    const expectedFormattedTime = `${year}/${month}/${day} ${hours}:${minutes}:${seconds}`;

    expect(getPastTime()).toBe(expectedFormattedTime);

    vi.useRealTimers();
  });
});
