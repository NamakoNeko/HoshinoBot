import os
def get_environ(var_name, default_value=''):
    return os.environ.get(var_name) if os.environ.get(var_name) else default_value


def get_list_environ(var_name, default_value, delimiter=','):
    if os.environ.get(var_name):
        return os.environ.get(var_name).split(delimiter)
    else:
        return default_value


def get_bool_environ(var_name, default_value=False):
    if default_value:
        if var_name.lower() == 'false':
            return False
        if var_name.lower() == 'true':
            return True
        return False if os.environ.get(var_name) else default_value
    else:
        return True if os.environ.get(var_name) else default_value
