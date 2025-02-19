;<CampaignInvitations
  {...props}
  leads={leads}
  actions={[
    {
      label: 'View Details',
      icon: 'fa fa-eye',
      onClick: e => rowClickHandler(e, lead),
    },
    {
      label: 'Copy Invite Link',
      icon: 'fa fa-link',
      onClick: e => {
        e.stopPropagation()
        navigator.clipboard.writeText(
          `${INVITE_LANDING_PAGE_PREFIX}${lead.interaction?.invitation?.shortCode}`
        )
      },
    },
  ]}
  rowClickHandler={rowClickHandler}
/>
