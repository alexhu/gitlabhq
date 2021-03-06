// These need to match what is returned from the server
export const APPLICATION_STATUS = {
  NOT_INSTALLABLE: 'not_installable',
  INSTALLABLE: 'installable',
  SCHEDULED: 'scheduled',
  INSTALLING: 'installing',
  INSTALLED: 'installed',
  UPDATED: 'updated',
  UPDATING: 'updating',
  ERROR: 'errored',
};

// These are only used client-side
export const REQUEST_LOADING = 'request-loading';
export const REQUEST_SUCCESS = 'request-success';
export const REQUEST_FAILURE = 'request-failure';
export const INGRESS = 'ingress';
export const JUPYTER = 'jupyter';
