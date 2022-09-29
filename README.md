# arangodb-jmeter-server

Example of dockerfile for builing jmeter server for load testing arangodb.
Build arguments:

1. `JMETER_VERSION` -- Jmeter version, by default `5.5`;
2. `ARANGO_VERSION` -- Version of arangodb-driver, by default `6.18.0`;
3. `SSL` -- if seet to `true`, self-signed generated certificate will be used, by default `false`