# frozen_string_literal: true

$: << File.expand_path(File.dirname(__FILE__))

Encoding.default_external = 'UTF-8'

module QA
  ##
  # GitLab QA runtime classes, mostly singletons.
  #
  module Runtime
    autoload :Release, 'qa/runtime/release'
    autoload :User, 'qa/runtime/user'
    autoload :Namespace, 'qa/runtime/namespace'
    autoload :Scenario, 'qa/runtime/scenario'
    autoload :Browser, 'qa/runtime/browser'
    autoload :Env, 'qa/runtime/env'
    autoload :Address, 'qa/runtime/address'
    autoload :Path, 'qa/runtime/path'
    autoload :Fixtures, 'qa/runtime/fixtures'

    module API
      autoload :Client, 'qa/runtime/api/client'
      autoload :Request, 'qa/runtime/api/request'
    end

    module Key
      autoload :Base, 'qa/runtime/key/base'
      autoload :RSA, 'qa/runtime/key/rsa'
      autoload :ECDSA, 'qa/runtime/key/ecdsa'
      autoload :ED25519, 'qa/runtime/key/ed25519'
    end
  end

  ##
  # GitLab QA fabrication mechanisms
  #
  module Factory
    autoload :Base, 'qa/factory/base'
    autoload :Dependency, 'qa/factory/dependency'
    autoload :Product, 'qa/factory/product'

    module Resource
      autoload :Sandbox, 'qa/factory/resource/sandbox'
      autoload :Group, 'qa/factory/resource/group'
      autoload :Issue, 'qa/factory/resource/issue'
      autoload :Project, 'qa/factory/resource/project'
      autoload :MergeRequest, 'qa/factory/resource/merge_request'
      autoload :ProjectImportedFromGithub, 'qa/factory/resource/project_imported_from_github'
      autoload :MergeRequestFromFork, 'qa/factory/resource/merge_request_from_fork'
      autoload :DeployKey, 'qa/factory/resource/deploy_key'
      autoload :DeployToken, 'qa/factory/resource/deploy_token'
      autoload :Branch, 'qa/factory/resource/branch'
      autoload :SecretVariable, 'qa/factory/resource/secret_variable'
      autoload :Runner, 'qa/factory/resource/runner'
      autoload :PersonalAccessToken, 'qa/factory/resource/personal_access_token'
      autoload :KubernetesCluster, 'qa/factory/resource/kubernetes_cluster'
      autoload :User, 'qa/factory/resource/user'
      autoload :ProjectMilestone, 'qa/factory/resource/project_milestone'
      autoload :Wiki, 'qa/factory/resource/wiki'
      autoload :File, 'qa/factory/resource/file'
      autoload :Fork, 'qa/factory/resource/fork'
      autoload :SSHKey, 'qa/factory/resource/ssh_key'
    end

    module Repository
      autoload :Push, 'qa/factory/repository/push'
      autoload :ProjectPush, 'qa/factory/repository/project_push'
      autoload :WikiPush, 'qa/factory/repository/wiki_push'
    end

    module Settings
      autoload :HashedStorage, 'qa/factory/settings/hashed_storage'
    end
  end

  ##
  # GitLab QA Scenarios
  #
  module Scenario
    ##
    # Support files
    #
    autoload :Bootable, 'qa/scenario/bootable'
    autoload :Actable, 'qa/scenario/actable'
    autoload :Template, 'qa/scenario/template'

    ##
    # Test scenario entrypoints.
    #
    module Test
      autoload :Instance, 'qa/scenario/test/instance'
      module Instance
        autoload :All, 'qa/scenario/test/instance/all'
        autoload :Smoke, 'qa/scenario/test/instance/smoke'
      end

      module Integration
        autoload :Github, 'qa/scenario/test/integration/github'
        autoload :LDAP, 'qa/scenario/test/integration/ldap'
        autoload :InstanceSAML, 'qa/scenario/test/integration/instance_saml'
        autoload :Kubernetes, 'qa/scenario/test/integration/kubernetes'
        autoload :Mattermost, 'qa/scenario/test/integration/mattermost'
        autoload :ObjectStorage, 'qa/scenario/test/integration/object_storage'
      end

      module Sanity
        autoload :Framework, 'qa/scenario/test/sanity/framework'
        autoload :Selectors, 'qa/scenario/test/sanity/selectors'
      end
    end
  end

  ##
  # Classes describing structure of GitLab, pages, menus etc.
  #
  # Needed to execute click-driven-only black-box tests.
  #
  module Page
    autoload :Base, 'qa/page/base'
    autoload :View, 'qa/page/view'
    autoload :Element, 'qa/page/element'
    autoload :Validator, 'qa/page/validator'

    module Main
      autoload :Login, 'qa/page/main/login'
      autoload :Menu, 'qa/page/main/menu'
      autoload :OAuth, 'qa/page/main/oauth'
      autoload :SignUp, 'qa/page/main/sign_up'
    end

    module Settings
      autoload :Common, 'qa/page/settings/common'
    end

    module Dashboard
      autoload :Projects, 'qa/page/dashboard/projects'
      autoload :Groups, 'qa/page/dashboard/groups'
    end

    module Group
      autoload :New, 'qa/page/group/new'
      autoload :Show, 'qa/page/group/show'
    end

    module File
      autoload :Form, 'qa/page/file/form'
      autoload :Show, 'qa/page/file/show'

      module Shared
        autoload :CommitMessage, 'qa/page/file/shared/commit_message'
      end
    end

    module Project
      autoload :New, 'qa/page/project/new'
      autoload :Show, 'qa/page/project/show'
      autoload :Activity, 'qa/page/project/activity'
      autoload :Menu, 'qa/page/project/menu'

      module Import
        autoload :Github, 'qa/page/project/import/github'
      end

      module Pipeline
        autoload :Index, 'qa/page/project/pipeline/index'
        autoload :Show, 'qa/page/project/pipeline/show'
      end

      module Job
        autoload :Show, 'qa/page/project/job/show'
      end

      module Settings
        autoload :Common, 'qa/page/project/settings/common'
        autoload :Advanced, 'qa/page/project/settings/advanced'
        autoload :Main, 'qa/page/project/settings/main'
        autoload :Repository, 'qa/page/project/settings/repository'
        autoload :CICD, 'qa/page/project/settings/ci_cd'
        autoload :DeployKeys, 'qa/page/project/settings/deploy_keys'
        autoload :DeployTokens, 'qa/page/project/settings/deploy_tokens'
        autoload :ProtectedBranches, 'qa/page/project/settings/protected_branches'
        autoload :SecretVariables, 'qa/page/project/settings/secret_variables'
        autoload :Runners, 'qa/page/project/settings/runners'
        autoload :MergeRequest, 'qa/page/project/settings/merge_request'
        autoload :Members, 'qa/page/project/settings/members'
      end

      module Issue
        autoload :New, 'qa/page/project/issue/new'
        autoload :Show, 'qa/page/project/issue/show'
        autoload :Index, 'qa/page/project/issue/index'
      end

      module Fork
        autoload :New, 'qa/page/project/fork/new'
      end

      module Milestone
        autoload :New, 'qa/page/project/milestone/new'
        autoload :Index, 'qa/page/project/milestone/index'
      end

      module Operations
        module Environments
          autoload :Index, 'qa/page/project/operations/environments/index'
          autoload :Show, 'qa/page/project/operations/environments/show'
        end

        module Kubernetes
          autoload :Index, 'qa/page/project/operations/kubernetes/index'
          autoload :Add, 'qa/page/project/operations/kubernetes/add'
          autoload :AddExisting, 'qa/page/project/operations/kubernetes/add_existing'
          autoload :Show, 'qa/page/project/operations/kubernetes/show'
        end
      end

      module Wiki
        autoload :Edit, 'qa/page/project/wiki/edit'
        autoload :New, 'qa/page/project/wiki/new'
        autoload :Show, 'qa/page/project/wiki/show'
      end

      module WebIDE
        autoload :Edit, 'qa/page/project/web_ide/edit'
      end
    end

    module Profile
      autoload :Menu, 'qa/page/profile/menu'
      autoload :PersonalAccessTokens, 'qa/page/profile/personal_access_tokens'
      autoload :SSHKeys, 'qa/page/profile/ssh_keys'
    end

    module Issuable
      autoload :Sidebar, 'qa/page/issuable/sidebar'
    end

    module Layout
      autoload :Banner, 'qa/page/layout/banner'
    end

    module MergeRequest
      autoload :New, 'qa/page/merge_request/new'
      autoload :Show, 'qa/page/merge_request/show'
    end

    module Admin
      autoload :Menu, 'qa/page/admin/menu'

      module Settings
        autoload :Repository, 'qa/page/admin/settings/repository'

        module Component
          autoload :RepositoryStorage, 'qa/page/admin/settings/component/repository_storage'
        end
      end
    end

    module Mattermost
      autoload :Main, 'qa/page/mattermost/main'
      autoload :Login, 'qa/page/mattermost/login'
    end

    ##
    # Classes describing components that are used by several pages.
    #
    module Component
      autoload :ClonePanel, 'qa/page/component/clone_panel'
      autoload :Dropzone, 'qa/page/component/dropzone'
      autoload :GroupsFilter, 'qa/page/component/groups_filter'
      autoload :Select2, 'qa/page/component/select2'
      autoload :DropdownFilter, 'qa/page/component/dropdown_filter'
      autoload :UsersSelect, 'qa/page/component/users_select'

      module Issuable
        autoload :Common, 'qa/page/component/issuable/common'
      end
    end
  end

  ##
  # Classes describing operations on Git repositories.
  #
  module Git
    autoload :Repository, 'qa/git/repository'
    autoload :Location, 'qa/git/location'
  end

  ##
  # Classes describing services being part of GitLab and how we can interact
  # with these services, like through the shell.
  #
  module Service
    autoload :Shellout, 'qa/service/shellout'
    autoload :KubernetesCluster, 'qa/service/kubernetes_cluster'
    autoload :Omnibus, 'qa/service/omnibus'
    autoload :Runner, 'qa/service/runner'
  end

  ##
  # Classes that make it possible to execute features tests.
  #
  module Specs
    autoload :Config, 'qa/specs/config'
    autoload :Runner, 'qa/specs/runner'
  end

  ##
  # Classes that describe the structure of vendor/third party application pages
  #
  module Vendor
    module SAMLIdp
      module Page
        autoload :Base, 'qa/vendor/saml_idp/page/base'
        autoload :Login, 'qa/vendor/saml_idp/page/login'
      end
    end
  end
end

QA::Runtime::Release.extend_autoloads!
