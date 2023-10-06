import ProjectDescription

let name = "FeatureA"
let project = Project(
  name: name,
  organizationName: "tuist.io",
  targets: [
    Target(
      name: name,
      platform: .iOS,
      product: .staticFramework,
      bundleId: "io.tuist." + name,
      sources: ["Sources/**"]
    ),
    Target(
      name: name + "Tests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "io.tuist.tests." + name,
      sources: ["Tests/**"],
      dependencies: [
        .target(name: name),
        .xctest
      ]
    ),
  ]
)
