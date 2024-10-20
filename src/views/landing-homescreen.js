import React from 'react'

import { Helmet } from 'react-helmet'

import './landing-homescreen.css'

const LandingHomescreen = (props) => {
  return (
    <div className="landing-homescreen-container">
      <Helmet>
        <title>exported project</title>
      </Helmet>
      <div className="landing-homescreen-landing-homescreen">
        <button className="landing-homescreen-navigation-button-list">
          <button className="landing-homescreen-navigation-button1">
            <img
              alt="ActivityI341"
              src="/external/activityi341-eggr.svg"
              className="landing-homescreen-activity"
            />
            <span className="landing-homescreen-text10 SingleLineBodySmallStrong">
              <span>Proposals</span>
            </span>
          </button>
          <button className="landing-homescreen-navigation-button2">
            <img
              alt="StarI341"
              src="/external/stari341-0lpr.svg"
              className="landing-homescreen-star"
            />
            <span className="landing-homescreen-text12 SingleLineBodySmallStrong">
              <span>Projects</span>
            </span>
          </button>
        </button>
        <div className="landing-homescreen-frame25">
          <div className="landing-homescreen-group9">
            <div className="landing-homescreen-frame20">
              <div className="landing-homescreen-status-bari-phone14">
                <div className="landing-homescreen-left-side">
                  <div className="landing-homescreen-frame-status-bartime">
                    <span className="landing-homescreen-text14 DefaultBoldBody">
                      <span>9:41</span>
                    </span>
                  </div>
                </div>
                <div className="landing-homescreen-right-side">
                  <div className="landing-homescreen-battery">
                    <img
                      alt="OutlineI341"
                      src="/external/outlinei341-hn9f.svg"
                      className="landing-homescreen-outline"
                    />
                    <img
                      alt="BatteryEndI341"
                      src="/external/batteryendi341-6bt8.svg"
                      className="landing-homescreen-battery-end"
                    />
                    <img
                      alt="FillI341"
                      src="/external/filli341-k5s.svg"
                      className="landing-homescreen-fill"
                    />
                  </div>
                  <img
                    alt="WifiI341"
                    src="/external/wifii341-22em.svg"
                    className="landing-homescreen-wifi"
                  />
                  <img
                    alt="IconMobileSignalI341"
                    src="/external/iconmobilesignali341-752s.svg"
                    className="landing-homescreen-icon-mobile-signal"
                  />
                </div>
              </div>
              <div className="landing-homescreen-avatar-block">
                <div className="landing-homescreen-avatar">
                  <img
                    alt="ShapeI341"
                    src="/external/shapei341-dbbf-200w.png"
                    className="landing-homescreen-shape"
                  />
                </div>
                <div className="landing-homescreen-info">
                  <span className="landing-homescreen-text16 BodyStrong">
                    <span>Sara Menon</span>
                  </span>
                  <span className="landing-homescreen-text18 BodyBase">
                    <span>Housing Association member</span>
                  </span>
                </div>
              </div>
            </div>
            <button className="landing-homescreen-button">
              <img
                alt="Edit3I341"
                src="/external/edit3i341-yv9l.svg"
                className="landing-homescreen-edit3"
              />
              <span className="landing-homescreen-text20 SingleLineBodyBase">
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
            <div className="landing-homescreen-menu-separator">
              <img
                alt="RuleI341"
                src="/external/rulei341-rnl-200h.png"
                className="landing-homescreen-rule"
              />
            </div>
          </div>
          <div className="landing-homescreen-frame241">
            <div className="landing-homescreen-tabs">
              <div className="landing-homescreen-tab1">
                <span className="landing-homescreen-text22 BodyBase">
                  <span>Open</span>
                </span>
              </div>
              <div className="landing-homescreen-tab2">
                <span className="landing-homescreen-text24 BodyBase">
                  <span>Closed</span>
                </span>
              </div>
            </div>
            <div className="landing-homescreen-frame191">
              <div className="landing-homescreen-frame242">
                <div className="landing-homescreen-frame192">
                  <div className="landing-homescreen-menu-item">
                    <img
                      alt="Loader3414"
                      src="/external/loader3414-05y8.svg"
                      className="landing-homescreen-loader"
                    />
                    <div className="landing-homescreen-body">
                      <div className="landing-homescreen-row">
                        <span className="landing-homescreen-text26 BodyBase">
                          <span>Fountain Repair</span>
                        </span>
                        <div className="landing-homescreen-menu-shortcut">
                          <span className="landing-homescreen-text28 SingleLineBodySmallStrong">
                            <span>Voting In Progress</span>
                          </span>
                        </div>
                      </div>
                      <span className="landing-homescreen-text30 BodySmall">
                        <span>
                          Central park fountain requires extensive repairs
                          including pump replacement, plumbing system overhaul,
                          and structural repairs.
                        </span>
                      </span>
                      <div className="landing-homescreen-tag">
                        <span className="landing-homescreen-text32 SingleLineBodyBase">
                          <span>Plumbing</span>
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default LandingHomescreen
