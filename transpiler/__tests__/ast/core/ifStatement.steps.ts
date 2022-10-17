/**
 *  Bitloops Language CLI
 *  Copyright (C) 2022 Bitloops S.A.
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 *  For further information you can contact legal(at)bitloops.com.
 */
import { defineFeature, loadFeature } from 'jest-cucumber';
import { decode, d } from 'bitloops-gherkin';

import main from '../../../../src/functions/bitloopsLanguageToModel/bitloops-parser/core/BitloopsVisitor/main.js';

const feature = loadFeature(
  './__tests__/features/bitloopsLanguageToModel/modelFragments/ifStatement.feature',
);

defineFeature(feature, (test) => {
  test('IfStatement is valid', ({ given, when, then }) => {
    let blString;
    let modelOutput;
    let result;

    given(/^A valid ifStatement (.*) string$/, (arg0) => {
      blString = decode(arg0);
    });

    when('I generate the model', () => {
      result = main(blString);
    });

    then(/^I should get (.*)$/, (arg0) => {
      modelOutput = d(arg0);
      expect(result).toEqual(JSON.parse(modelOutput));
    });
  });
});
