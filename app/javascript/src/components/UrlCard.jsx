import React from "react";

const UrlCard = ({
  setPinned,
  id,
  pinnedAt,
  originalUrl,
  shortUrl,
  counter,
}) => {
  const starClass =
        "font-black	text-xl ri-star-line mr-2 hover:text-green-500 cursor-pointer";

  return (
    <div key={id} className="flex justify-between mb-2">
      <div className="w-1/2">
        <i
          onClick={e => {
            setPinned(id);
          }}
          className={
            pinnedAt ? "text-yellow-800 " + starClass : starClass
          }
        ></i>
        <a
          target="_blank"
          rel="noreferrer"
          href={`https://${originalUrl}`}
        >
                    https://{originalUrl}
        </a>
      </div>
      <div className="w-1/2 flex justify-between">
        <a target="_blank" rel="noreferrer" href={"/s/" + shortUrl}>
                    https://citly-l0.herokuapp.com/s/{shortUrl}
        </a>
        <span className="tet-gray-700 ml-4 mw-1.5 bg-gray-300 p-4 text-center">
          {counter}
        </span>
      </div>
    </div>
  );
};

export default UrlCard;
