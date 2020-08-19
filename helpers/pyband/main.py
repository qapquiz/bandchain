from pyband import Client, PyObi


def main():
    c = Client("http://poa-api.bandchain.org")
    req_info = c.get_latest_request(
        6, bytes.fromhex("000000045041584700000003555344000000003b9aca00"), 4, 4
    )
    oracle_script = c.get_oracle_script(6)
    obi = PyObi(oracle_script.schema)
    print(obi.decode_output(req_info.result.response_packet_data.result))


if __name__ == "__main__":
    main()
