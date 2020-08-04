Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k30wE-00063J-I2
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2020 13:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josh@joshdubois.com>)
 id 1k30wC-00062q-R6
 for qemu-trivial@nongnu.org; Tue, 04 Aug 2020 13:41:20 -0400
Received: from jax4mhob24.registeredsite.com ([64.69.218.112]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josh@joshdubois.com>)
 id 1k30wA-0002of-IL
 for qemu-trivial@nongnu.org; Tue, 04 Aug 2020 13:41:20 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.113])
 by jax4mhob24.registeredsite.com (8.14.4/8.14.4) with ESMTP id 074HfDkn155470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <qemu-trivial@nongnu.org>; Tue, 4 Aug 2020 13:41:15 -0400
Received: (qmail 6687 invoked by uid 0); 4 Aug 2020 17:41:13 -0000
X-TCPREMOTEIP: 50.93.248.134
X-Authenticated-UID: josh@joshdubois.com
Received: from unknown (HELO ?192.168.1.5?) (josh@joshdubois.com@50.93.248.134)
 by 0 with ESMTPA; 4 Aug 2020 17:41:13 -0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] trace/simple: Allow enabling simple traces from command
 line
From: Josh DuBois <josh@joshdubois.com>
In-Reply-To: <87h7tkm70n.fsf@dusky.pond.sub.org>
Date: Tue, 4 Aug 2020 12:41:12 -0500
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
 Josh DuBois <duboisj@gmail.com>, qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A86BEB45-4022-4D7C-936C-5CDCC580EBF8@joshdubois.com>
References: <20200723053359.256928-1-josh@joshdubois.com>
 <20200729130535.GI37763@stefanha-x1.localdomain>
 <e08651bd-f775-eb85-817c-44d27ff072dc@joshdubois.com>
 <87h7tkm70n.fsf@dusky.pond.sub.org>
To: Markus Armbruster <armbru@redhat.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Received-SPF: neutral client-ip=64.69.218.112;
 envelope-from=josh@joshdubois.com; helo=jax4mhob24.registeredsite.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 13:41:16
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 04 Aug 2020 17:41:21 -0000

On Aug 3, 2020, at 4:08 AM, Markus Armbruster <armbru@redhat.com> wrote:
>=20
>>=20
>> - prior to db25d56c014aa1a96319c663e0a60346a223b31e, just like today,
>> QEMU built with simple tracing will always produce a trace-<pid> =
file,
>> regardless of whether the user asks for traces at runtime.
>=20
> When you send a patch with a Fixes: tag, consider cc'ing people =
involved
> in the commit being fixed.  I might have spotted the regression.

Sure, this makes sense. =20

> I missed the CLI issue.  I just wanted my directories not littered =
with
> trace files ;)
>=20
> Stefan, what shall we do for 5.1?
>=20
> If we keep littering, the annoyance will make me drop the trace =
backend
> "simple" from my build tests.  I might even remember to put it back =
when
> the fix arrives.

I haven't seen another response, but I just noticed a 'last call' for =
5.1.  If this means something is going to get excluded from regular =
build tests, that seems important - I for one have no objection to =
simply reverting this - 1b7157be3a8c4300fc8044d40f4b2e64a152a1b4 <-- my =
"fix."

I will try to send a better fix along sometime soonish, but I probably =
won't get to that before 5.1.  If the nuisance of the trace-<pid> files =
is causing real-world problems for someone actually doing regular =
development, that seems more important than the command line issue, to =
me.  Just my $0.02.

Cheers, and sorry if your build dirs do end up littered again.=

