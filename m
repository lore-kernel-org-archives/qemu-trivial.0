Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZEvbh-00071o-AY
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jul 2015 04:30:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZEvbg-00070U-1n
	for qemu-trivial@nongnu.org; Tue, 14 Jul 2015 04:30:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZEvbe-0002MU-Um
	for qemu-trivial@nongnu.org; Tue, 14 Jul 2015 04:30:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43853)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZEvbS-0002IP-4w; Tue, 14 Jul 2015 04:30:14 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 814362B9DDE;
	Tue, 14 Jul 2015 08:30:13 +0000 (UTC)
Received: from [10.36.112.33] (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6E8U9DC028681
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 14 Jul 2015 04:30:11 -0400
To: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1436815589-19194-1-git-send-email-jsnow@redhat.com>
	<CAFEAcA_hE0eepawDhF2DBidhd6iXvOx2f6w11+gFk-nh3Ju1XQ@mail.gmail.com>
	<55A41474.8000004@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55A4C890.70402@redhat.com>
Date: Tue, 14 Jul 2015 10:30:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <55A41474.8000004@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: coverity touchups
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jul 2015 08:30:28 -0000



On 13/07/2015 21:41, John Snow wrote:
>>> >> s->ports should never exceed 32, but coverity doesn't know that.
>>> >> ncq_tfs->sector_count should also never exceed 64K.
>> > 
>> > Personally I tend to mark that kind of thing as a false
>> > positive in the coverity UI and move on...
>> > 
>> > -- PMM
>> > 
> Either way; Paolo pinged me about the NCQ one so I figured I'd just do it.

Yeah, neither is particularly optimal.  Every now and then (a couple
years, say) you do have to re-evaluate false positives, so it's better
to fix them if possible.  On the other hand the code is uglier.

Let's ignore these in Coverity---with a triaging comment there about why
they are false positives.

Paolo

