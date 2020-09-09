Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kG3os-0008GI-5N
	for mharc-qemu-trivial@gnu.org; Wed, 09 Sep 2020 13:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kG3oq-0008Da-RZ
 for qemu-trivial@nongnu.org; Wed, 09 Sep 2020 13:23:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kG3oo-0008Ja-V6
 for qemu-trivial@nongnu.org; Wed, 09 Sep 2020 13:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599672217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AYiZgi4h+6eqgd3gj/RTG+eBMdIlEzpVOebQ8c0fUE0=;
 b=B3uHCVGRn+5l3RYjApndkE9/c2Zc0ro0jTBIRrQoihlMeEIptGebP++/aWoG+DhzbpeOdN
 fZzVQDB0xElQIW+mh/SNoG6Zs/8GcdeY98fY88lAd2/gvUMBYmB6tRCZgeAcCctHDXx/wT
 bXgvgLcFJSLDLbFW97i7iSQTQA0BUUM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-cMZH-D7LMha2gqIH3JNu1g-1; Wed, 09 Sep 2020 13:23:31 -0400
X-MC-Unique: cMZH-D7LMha2gqIH3JNu1g-1
Received: by mail-ed1-f70.google.com with SMTP id d13so1297714edz.18
 for <qemu-trivial@nongnu.org>; Wed, 09 Sep 2020 10:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=1p3ZwIpTH3dPYY8PdxWi0EMg1fRWGbTZDs6CU9KkMdo=;
 b=W0vz4JX8U9OWHEgfxZ8zZknfSgb8BZwcXmaHiWpXoxAPV3NugYr+eJWZxJ8HgaNPET
 bZZZV5IVIyJAKJIS5ebfrADnqOTPqgdfDxfp8wdnsIVa7weyqPgDcR9tflqjzrLKPKFp
 9e4poLFGrasYTZk+uN6cIssal8gG6ltS3/xTZrvAHJGuTl9ym4pDAJEIpCCWDN6N9pNj
 8wrsUVMLvcVhWn4xkJR8VHfwYeOhYUZbiH/H8/NrPr6kwQ0GIgQMLrSk2jyROzr0p6VQ
 qeIsvhIc+YHSI4SsOLGf9mPeA++6m76Kr0SMTljOB30n8iXRndgMDy4moXJm1U4b4zpu
 H9Bw==
X-Gm-Message-State: AOAM53093ncR56bDfYS30Y2gvfHYK6YbvrDrHUKrvw8JNZ8usfLn+Zik
 tnKepTqWkKMTbgtEH8n+8hiOkj7CIa4YAjKAyVSdOWswHliihco69Dy5FXjeM7DPsBqV0WFSBIZ
 lv5s251dRbIRyk3KtRQ==
X-Received: by 2002:a05:6402:1353:: with SMTP id
 y19mr5291435edw.71.1599672209860; 
 Wed, 09 Sep 2020 10:23:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4ssz4Q0QjqGwquAwPJ4F0RYg11yKDGuezlYvVrLjFlAq3vLDty1CTQhf2FN1HKaf2+Tn8UA==
X-Received: by 2002:a05:6402:1353:: with SMTP id
 y19mr5291410edw.71.1599672209539; 
 Wed, 09 Sep 2020 10:23:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:37de:1d96:8ea2:b59a?
 ([2001:b07:6468:f312:37de:1d96:8ea2:b59a])
 by smtp.gmail.com with ESMTPSA id k16sm3109722ejg.64.2020.09.09.10.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 10:23:28 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] rcu: add uninit destructor for rcu
To: Stefan Hajnoczi <stefanha@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Daniel Brodsky <dnbrdsky@gmail.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
References: <20200908151052.713-1-luoyonggang@gmail.com>
 <20200908151052.713-3-luoyonggang@gmail.com>
 <20200909084107.GE12090@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ef674b21-cdad-9aea-662e-315006438ed4@redhat.com>
Date: Wed, 9 Sep 2020 19:23:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200909084107.GE12090@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="x8S9bcrW7GJ1rgPbvmqBqejHejfptio5v"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 07:20:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Sep 2020 17:23:41 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--x8S9bcrW7GJ1rgPbvmqBqejHejfptio5v
Content-Type: multipart/mixed; boundary="fDS7oe3lcKUpGDgxoukzCeZ4EVWC9XcTN"

--fDS7oe3lcKUpGDgxoukzCeZ4EVWC9XcTN
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/09/20 10:41, Stefan Hajnoczi wrote:
> On Tue, Sep 08, 2020 at 11:10:52PM +0800, Yonggang Luo wrote:
>> This is necessary if the pending  rcu calls are closing and removing
>> temp files. This also provide a function
>> void rcu_wait_finished(void);
>> to fixes test-logging.c test failure on msys2/mingw.
>> On windows if the file doesn't closed, you can not remove it.
>>
>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>> ---
>>  include/qemu/rcu.h   |  5 +++++
>>  tests/test-logging.c |  2 ++
>>  util/rcu.c           | 37 ++++++++++++++++++++++++++++++++++++-
>>  3 files changed, 43 insertions(+), 1 deletion(-)
> Can the new drain_call_rcu() function be used? Maxim recently posted the
> following patch:
> https://patchew.org/QEMU/20200831150124.206267-1-mlevitsk@redhat.com/2020=
0831150124.206267-3-mlevitsk@redhat.com/
>=20
> Whether drain_call_rcu() or rcu_wait_finished() is used, please include
> a comment in the code that documents why the wait is necessary. For
> example, "qemu_log_close() uses RCU for its FILE pointer but Windows
> cannot remove open files, so we need to wait for RCU here".
>=20
> Another option is to wait for RCU inside qemu_log_close() so that
> callers don't need to worry about this implementation detail:
>=20
>   #ifdef _WIN32
>   /* Windows cannot remove open files so we need to wait for RCU here */
>   drain_call_rcu();
>   #endif
>=20

In this case even synchronize_rcu() should be okay.

Paolo


--fDS7oe3lcKUpGDgxoukzCeZ4EVWC9XcTN--

--x8S9bcrW7GJ1rgPbvmqBqejHejfptio5v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAl9ZD5QACgkQv/vSX3jH
roP5nwf/SRSYatVuF6tGNWiB0ly3abNl3Y+n9hgjQ1bOcgK1Cuk8k3GYFPgCLJYP
SyYh9aNfkJLBExc73BDt7VOW4PVqVvLOO8nkIISTcnAAKjARaDJvDsa28FA9Q7k1
5LaGrvgJmqbGRc2lM9s/5wFKmzUYI+eodjHIulg2KfKNz8Yjqry5H44RdCqEm+Gj
s8jje5pYJ6k6jUelaQkLFCRTI1Btck5jIdHQ5tXB+h/UtSgkPZvYNvoDzmxdNo6M
Kjw9NKLZ7rHKM9uEzuUpq/QI4bz1lRBnZTmVX82+kGZowkiYiK4xRkgITFx9PCCu
k1WuPLv0o9d8gJfXxViUEVdomhVP9A==
=g4X0
-----END PGP SIGNATURE-----

--x8S9bcrW7GJ1rgPbvmqBqejHejfptio5v--


