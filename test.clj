(+ 2 3)

(defn pairs-of-values
  (let [args ["--server" "localhost"
               "--port" "8080"
               "--environment" "production"]]
      (is (= {:server "localhost"
              :port "8080"
              :environment "production"}
              (parse-args args)))))

