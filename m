Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBd3u-0000mX-MV
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 05:19:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBd3q-0000je-NN
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 05:19:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBd3l-0004K3-Pu
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 05:19:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52744 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fBd3c-0004Ha-L4; Thu, 26 Apr 2018 05:19:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2CA76406C745;
	Thu, 26 Apr 2018 09:19:16 +0000 (UTC)
Received: from [10.36.116.75] (ovpn-116-75.ams2.redhat.com [10.36.116.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C25F8443E;
	Thu, 26 Apr 2018 09:19:08 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
Cc: Olaf Hering <olaf@aepfle.de>, Fam Zheng <famz@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
	<CAFEAcA_TtC-p4JJFRPaBFwim1a8J9G+z79KAK8vqrTx7ZKjOKg@mail.gmail.com>
	<20180418144433.GV27579@redhat.com>
	<CAFEAcA8jXwo35B7KVdVZEiqZTtMRvVXCP87iHKECjWPkHiTJ_A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <91e6dbdd-6086-7c60-4bc9-a6ace1d041fc@redhat.com>
Date: Thu, 26 Apr 2018 11:19:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8jXwo35B7KVdVZEiqZTtMRvVXCP87iHKECjWPkHiTJ_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 26 Apr 2018 09:19:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 26 Apr 2018 09:19:16 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2018 09:19:34 -0000

On 26.04.2018 10:17, Peter Maydell wrote:
> On 18 April 2018 at 15:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>> On Wed, Apr 18, 2018 at 02:29:47PM +0100, Peter Maydell wrote:
>>> Yes, my OSX build system is on glib 2.22. It's using 'fink' for 3rd
>>> party library installations, and they somehow seem to have got stuck
>>> on 2.22. Looking at the website the project seems to have basically
>>> stagnated, and I guess I need to move to homebrew at some point
>>> (likely after we get 2.12 out the door). But for the moment this
>>> patch would break my pullrequest testing builds.
>>
>> Yeah that sounds reasonable as it would also align your build env with
>> what we are testing via travis too.
>=20
> I've now made the switch to homebrew, and so my OSX build tests
> will be using glib 2.56. NB that this means that none of my merge
> testing will catch "glib version too old" for our current setting
> of "too old" -- I'm not sure what my current oldest version is in
> the test machine set.
>=20
> I've also upgraded Xcode, which means I now have a machine with
> a clang that emits all the -Waddress-of-packed-member complaints.
> I have configured the test build so those aren't fatal
> (via --extra-cflags=3D'-Werror -Wno-error=3Daddress-of-packed-member
> -Wno-error=3Ddeprecated-declarations') but I'm now more interested in
> getting those cleaned up so they don't clutter up my logfiles :-)

Isn't the -Wno-error=3Daddress-of-packed-members flag added by Gerd's
patch already? See:

https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D0e39c4aa7ecc5699bc3=
91fcb

 Thomas

