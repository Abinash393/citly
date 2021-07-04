import axios from "axios";

const linksUrl = "/api/v1/links/";

const list = () => axios.get(linksUrl);
const create = payload => axios.post(linksUrl, payload);
const pinned = id => axios.post(linksUrl + "pinned/" + id);

const linksApi = { create, list, pinned };

export default linksApi;
