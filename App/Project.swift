import ProjectDescription

let name = "App"
let project = Project(
  name: name,
  organizationName: "tuist.io",
  targets: [
    Target(
      name: name,
      platform: .iOS,
      product: .app,
      bundleId: "io.tuist.App",
      sources: ["Sources/**"],
      dependencies: [
        .project(
          target: "FeatureA",
          path: .relativeToRoot("FeatureA")
        ),
      ]
    ),
    Target(
      name: name + "Tests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "io.tuist.App",
      sources: ["Tests/**"],
      dependencies: [
        .target(name: name),
        .project(
          target: "FeatureA",
          path: .relativeToRoot("FeatureA")
        ),
        .xctest
      ]
    ),
  ]
)
