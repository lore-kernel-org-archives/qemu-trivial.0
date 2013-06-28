Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsYKe-0001W0-DS
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 09:03:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UsYKX-0001PU-Ti
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 09:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UsYKW-0007Di-5e
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 09:03:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1UsYKV-0007DT-V6; Fri, 28 Jun 2013 09:03:12 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5SD37QC008861
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 28 Jun 2013 09:03:08 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-50.ams2.redhat.com
	[10.36.112.50])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5SD34oH014617; Fri, 28 Jun 2013 09:03:05 -0400
Message-ID: <51CD8985.6020401@redhat.com>
Date: Fri, 28 Jun 2013 15:03:01 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51CD669A.1010100@msgid.tls.msk.ru>
	<CAPyFy2Bzh-nK7zkc3JwvPEd4AYH0CriA1vu_kGqoCXdaAk0i1A@mail.gmail.com>
In-Reply-To: <CAPyFy2Bzh-nK7zkc3JwvPEd4AYH0CriA1vu_kGqoCXdaAk0i1A@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Fri, 28 Jun 2013 13:03:18 -0000

Il 28/06/2013 14:54, Ed Maste ha scritto:
> On 28 June 2013 06:34, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 24.06.2013 23:21, Ed Maste wrote:
>>> Signed-off-by: Ed Maste <emaste@freebsd.org>
>>> ---
>>> I have had this in a local tree for some time, and it is needed by the
>>> BSD-user work that is now being proposed.
>>
>> So I'm not applying this to -trivial, because it caused quite some
>> discussion.  If nevertheless it's okay to apply it, please let me know.
>>
>> /mjt
> 
> An objection seemed to be that it is not really needed yet, but as
> pointed out by Peter this isn't really the case.  This patch brings us
> (FreeBSD) in line with per-thread data semantics on Linux and is used
> by qemu system emulation as well.

It brings it in line with Linux, even though FreeBSD has the same need
for TLS as OpenBSD and Windows (i.e. none).  In other words, we go from
two cases (need TLS and uses it, has no TLS and doesn't need it) to
three (we add "uses TLS with no need for it").

qemu/tls.h is currently a hack.  When it will grow to something useful
(soon), rest assured that FreeBSD will be supported properly.

Paolo

> The other discussion was all around platforms unaffected by this
> change (OpenBSD, Windows); I don't see it as an argument either for or
> against this change.  So I think it's reasonable to go in.
> 


