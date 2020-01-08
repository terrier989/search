// Copyright 2019 terrier989@gmail.com.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:datastore/adapters_framework.dart';
import 'package:datastore/datastore.dart';

/// Mixin for read-only datastores.
mixin ReadOnlyDatastoreAdapter implements DatastoreAdapter {
  @override
  WriteBatch newWriteBatch() {
    throw UnsupportedError('Datastore is read-only');
  }

  @override
  Future<void> performWrite(WriteRequest request) {
    return Future<Transaction>.error(
      UnsupportedError('Datastore is read-only'),
    );
  }

  @override
  Future<void> runInTransaction(
      {Duration timeout,
      Future<void> Function(Transaction transaction) callback}) {
    return Future<Transaction>.error(
      UnsupportedError('Datastore is read-only'),
    );
  }
}
