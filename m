Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UhCkB-0007Ql-Fg
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2013 01:46:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1UhCk4-0007Oi-A0
	for qemu-trivial@nongnu.org; Tue, 28 May 2013 01:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1UhCk2-0008Js-Ai
	for qemu-trivial@nongnu.org; Tue, 28 May 2013 01:46:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36026)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1UhCk2-0008JV-18; Tue, 28 May 2013 01:46:38 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4S5kVGR014408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 28 May 2013 01:46:32 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4S5kTfs003132; Tue, 28 May 2013 01:46:29 -0400
Message-ID: <51A444B4.3020006@redhat.com>
Date: Tue, 28 May 2013 07:46:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130513 Thunderbird/17.0.6
MIME-Version: 1.0
To: li guang <lig.fnst@cn.fujitsu.com>
References: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51A323B4.2000101@redhat.com>
	<1369701066.19028.53.camel@liguang.fnst.cn.fujitsu.com>
In-Reply-To: <1369701066.19028.53.camel@liguang.fnst.cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r4S5kVGR014408
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 0/4] debugcon: fix some bugs when
	DEBUG_DEBUGCON
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
X-List-Received-Date: Tue, 28 May 2013 05:46:46 -0000

On 05/28/13 02:31, li guang wrote:
> =E5=9C=A8 2013-05-27=E4=B8=80=E7=9A=84 11:13 +0200=EF=BC=8CGerd Hoffman=
n=E5=86=99=E9=81=93=EF=BC=9A
>> On 05/24/13 04:47, liguang wrote:
>>> when enable DEBUG_DEBUGCON, there are some message
>>> printing bugs, so fix them.
>>
>> I'd suggest to either simply remove the debug printfs or turn them int=
o
>> tracepoints.
>>
>=20
> sorry, why we simply remove debug message printing?
> it's un-useful at all?

It's a case-by-case thing.

Debug messages logging guest activity like port access tend to be useful
for trouble-shooting.  They should be turned into tracepoints, so they
can be toggled at runtime and integrate nicely with tracing tools.

Sometimes debug messages are just leftovers and don't serve a real
purpose (any more).  Then it is best to simply remove them.

In the debugcon case I'd tend to simply remove them given how trivial
the device is.  But if you prefer making them tracepoints I'm ok with tha=
t.

cheers,
  Gerd


