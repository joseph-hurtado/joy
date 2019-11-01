(import ./joy/env :as env)
(import ./joy/logger :as logger)
(import ./joy/responder :as responder)
(import ./joy/helper :as helper)
(import ./joy/html :as html)
(import ./joy/router :as router)
(import ./joy/middleware :as middleware)
(import ./joy/db :as db)
(import ./joy/validator :as validator)
(import circlet)
(import json)
(import sqlite3)

(def env env/get-env)

(def logger logger/middleware)
(def log logger/log)

(def respond responder/respond)
(def render responder/respond)
(def redirect responder/redirect)

(def rescue helper/rescue)
(def select-keys helper/select-keys)

(def html html/render)
(def raw-html html/raw)
(def doctype html/doctype)

(def json-encode json/encode)
(def json-decode json/decode)

(def serve circlet/server)

(def app router/handler)
(def routes router/routes)
(def middleware router/middleware)

(def static-files middleware/static-files)
(def body-parser middleware/body-parser)
(def set-cookie middleware/set-cookie)
(def set-layout middleware/set-layout)
(def server-error middleware/server-error)
(def set-db middleware/set-db)
(def session middleware/session)
(def extra-methods middleware/extra-methods)

(def query db/query)
(def execute db/execute)
(def fetch db/fetch)
(def fetch-all db/fetch-all)
(def from db/from)
(def insert db/insert)
(def insert-all db/insert-all)
(def update db/update)
(def update-all db/update-all)
(def delete db/delete)
(def delete-all db/delete-all)

(defmacro with-db-connection [binding & body]
  (with-syms [$rows]
   ~(let [,(first binding) (,sqlite3/open ,(get binding 1))
          ,$rows ,(splice body)]
      (,sqlite3/close ,(first binding))
      ,$rows)))

(def params validator/params)
(def validates validator/validates)
