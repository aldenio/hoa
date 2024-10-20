import React from 'react'

import { Helmet } from 'react-helmet'

import './landing-homescreen1.css'

const LandingHomescreen1 = (props) => {
  return (
    <div className="landing-homescreen1-container">
      <Helmet>
        <title>exported project</title>
      </Helmet>
      <div className="landing-homescreen1-landing-homescreen">
        <div className="landing-homescreen1-frame25">
          <div className="landing-homescreen1-group9">
            <div className="landing-homescreen1-frame20">
              <div className="landing-homescreen1-status-bari-phone14">
                <div className="landing-homescreen1-left-side">
                  <div className="landing-homescreen1-frame-status-bartime">
                    <span className="landing-homescreen1-text10 DefaultBoldBody">
                      <span>9:41</span>
                    </span>
                  </div>
                </div>
                <div className="landing-homescreen1-right-side">
                  <div className="landing-homescreen1-battery">
                    <img
                      alt="OutlineI237"
                      src="/external/outlinei237-yurn.svg"
                      className="landing-homescreen1-outline"
                    />
                    <img
                      alt="BatteryEndI237"
                      src="/external/batteryendi237-c8qd.svg"
                      className="landing-homescreen1-battery-end"
                    />
                    <img
                      alt="FillI237"
                      src="/external/filli237-wnsm.svg"
                      className="landing-homescreen1-fill"
                    />
                  </div>
                  <img
                    alt="WifiI237"
                    src="/external/wifii237-rmc9.svg"
                    className="landing-homescreen1-wifi"
                  />
                  <img
                    alt="IconMobileSignalI237"
                    src="/external/iconmobilesignali237-xk7p.svg"
                    className="landing-homescreen1-icon-mobile-signal"
                  />
                </div>
              </div>
              <div className="landing-homescreen1-avatar-block">
                <div className="landing-homescreen1-avatar">
                  <img
                    alt="ShapeI237"
                    src="/external/shapei237-uepa-200w.png"
                    className="landing-homescreen1-shape"
                  />
                </div>
                <div className="landing-homescreen1-info">
                  <span className="landing-homescreen1-text12 BodyStrong">
                    <span>Sara Menon</span>
                  </span>
                  <span className="landing-homescreen1-text14 BodyBase">
                    <span>Housing Association member</span>
                  </span>
                </div>
              </div>
            </div>
            <button className="landing-homescreen1-button">
              <img
                alt="Edit3I237"
                src="/external/edit3i237-kas8.svg"
                className="landing-homescreen1-edit3"
              />
              <span className="landing-homescreen1-text16 SingleLineBodyBase">
                <span>
                  Create new project proposal
                  <span
                    dangerouslySetInnerHTML={{
                      __html: ' ',
                    }}
                  />
                </span>
              </span>
            </button>
            <div className="landing-homescreen1-menu-separator">
              <img
                alt="RuleI237"
                src="/external/rulei237-hi5t-200h.png"
                className="landing-homescreen1-rule"
              />
            </div>
          </div>
          <div className="landing-homescreen1-frame24">
            <div className="landing-homescreen1-tabs">
              <div className="landing-homescreen1-tab1">
                <span className="landing-homescreen1-text18 BodyBase">
                  <span>Open</span>
                </span>
              </div>
              <div className="landing-homescreen1-tab2">
                <span className="landing-homescreen1-text20 BodyBase">
                  <span>Closed</span>
                </span>
              </div>
            </div>
          </div>
        </div>
        <span className="landing-homescreen1-text22 BodyBase">
          <span>No open proposals</span>
        </span>
        <button className="landing-homescreen1-navigation-button-list">
          <button className="landing-homescreen1-navigation-button1">
            <img
              alt="ActivityI237"
              src="/external/activityi237-fdgbp.svg"
              className="landing-homescreen1-activity"
            />
            <span className="landing-homescreen1-text24 SingleLineBodySmallStrong">
              <span>Proposals</span>
            </span>
          </button>
          <button className="landing-homescreen1-navigation-button2">
            <img
              alt="StarI237"
              src="/external/stari237-kur.svg"
              className="landing-homescreen1-star"
            />
            <span className="landing-homescreen1-text26 SingleLineBodySmallStrong">
              <span>Projects</span>
            </span>
          </button>
        </button>
      </div>
    </div>
  )
}

export default LandingHomescreen1
