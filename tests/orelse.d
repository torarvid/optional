module tests.orelse;

import optional;

@("Should work with qualified optionals")
unittest {
    import std.meta: AliasSeq;
    alias T = string;
    foreach (U; AliasSeq!(T, const T, immutable T)) {
        foreach (V; AliasSeq!(Optional!T, const Optional!T, immutable Optional!T)) {
            V a = some("hello");
            T t = "world";
            assert(a.orElse(t) == "hello");
        }
    }
}

@("Should work with lambdas")
unittest {
    auto a = some("hello");
    auto b = no!string;
    assert(a.orElse!(() => "world") == "hello");
    assert(b.orElse!(() => "world") == "world");
}
