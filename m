Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLouH-0004Mc-G4
	for mharc-qemu-trivial@gnu.org; Mon, 25 Aug 2014 03:41:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XLouA-0004EJ-Fz
	for qemu-trivial@nongnu.org; Mon, 25 Aug 2014 03:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XLou5-0000fj-QA
	for qemu-trivial@nongnu.org; Mon, 25 Aug 2014 03:41:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XLotw-0000dJ-DX; Mon, 25 Aug 2014 03:41:16 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7P7fDwf002711
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 25 Aug 2014 03:41:13 -0400
Received: from blackfin.pond.sub.org (ovpn-116-66.ams2.redhat.com
	[10.36.116.66])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7P7fBHC003888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 25 Aug 2014 03:41:12 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C6DC4303FEA7; Mon, 25 Aug 2014 09:41:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dmitry Fleytman <dmitry@daynix.com>
References: <1408537634-3812-1-git-send-email-ben@xrsa.net>
	<53F9D55D.6060804@msgid.tls.msk.ru>
	<A9C9B9DB-AEEE-4D79-A968-E0F34671C865@daynix.com>
	<53F9E43D.2020103@msgid.tls.msk.ru>
	<2C43C4CF-F85B-4A13-81BC-B848F6663EA8@daynix.com>
Date: Mon, 25 Aug 2014 09:41:10 +0200
In-Reply-To: <2C43C4CF-F85B-4A13-81BC-B848F6663EA8@daynix.com> (Dmitry
	Fleytman's message of "Sun, 24 Aug 2014 16:27:40 +0300")
Message-ID: <87mwatyq21.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Tamir Shomer <tamirs@daynix.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Ben Draper <ben@xrsa.net>, Stefan Hajnoczi <stefanha@redhat.com>,
	Yan Vugenfirer <yan@daynix.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vmxnet3: Pad short frames
	to minimum size (60 bytes)
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
X-List-Received-Date: Mon, 25 Aug 2014 07:41:35 -0000

Dmitry Fleytman <dmitry@daynix.com> writes:

> On Aug 24, 2014, at 16:10 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
>> 24.08.2014 16:28, Dmitry Fleytman wrote:
>>=20
>>> Hi Michael,
>>>=20
>>> I=E2=80=99m the maintainer of vmxnet3/pvscsi devices in QEMU. Thanks fo=
r CC=E2=80=99ing me.
>>=20
>> Maybe you can add yourself to MAINTAINERS file as well? :)
>
> Yes, this should be done.
> How we do this? Should I send a patch for MAINTAINETRS?

Yes.

