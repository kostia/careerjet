# Ruby client for Careerjet's API

## Installation

```ruby
# Gemfile
gem 'careerjet'
```

## Usage

```ruby
Careerjet.search :en_US, :keywords => 'ruby', :page => 1
```

### Params

`keywords`: Keywords to search in job offers.

`location`: Location to search job offers in.

`sort`: Type of sort. Can be: `relevance` (default) - most relevant first, `date` - freshest offer first and `salary` - biggest salary first.

`start_num`: Number of first offer returned in entire result space. Should be >= 1 and <= Number of hits.

`pagesize`: Number of offers returned in one call.

`page`: Number of the asked page. Should be >=1. If this value is set, the eventually given `start_num` is overrided.

`contracttype`: Character code for contract type.`p` - permanent job, `c`- contract, `t`- temporary, `i`- training, `v`- voluntary, none - all contract types.

`contractperiod`: Character code for contract work period. `f` - full time, `p` - part time, none - all work period.

