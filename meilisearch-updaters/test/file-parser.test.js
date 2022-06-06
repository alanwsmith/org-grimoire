import { assert, test } from 'vitest';
import { GetFacetFromFileName } from '../src/file-parser.js';
import { GetFacetFromFileNameDev } from '../src/file-parser.js';

test('GetFacetFromFileName - One facet', () => {
    const fileName = `facet- test name.txt`;
    const expected = [`facet-`];
    const result = GetFacetFromFileName({
        fileName: fileName
    });
    assert.equal(result[0], expected[0]);
});


test('GetFacetFromFileName - One facet', () => {
    const fileName = `no facet here test name.txt`;
    const result = GetFacetFromFileName({
        fileName: fileName
    });
    assert.equal(result.length, 0);
});


test('GetFacetFromFileName - One word file name', () => {
    const fileName = `nowordfilename.txt`;
    const result = GetFacetFromFileName({
        fileName: fileName
    });
    assert.equal(result.length, 0);
});


test('GetFacetFromFileName - Filename with dashes', () => {
    const fileName = `no-wordfilename.txt`;
    const result = GetFacetFromFileName({
        fileName: fileName
    });
    assert.equal(result.length, 0);
});



test('GetFacetFromFileName - One facet from multiple dashes', () => {
    const fileName = `facet- skip- morestuff.txt`;
    const expected = ['facet-'];
    const result = GetFacetFromFileName({
        fileName: fileName
    });
    assert.equal(result[0], expected[0]);
});

