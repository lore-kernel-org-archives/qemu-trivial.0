Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUaYX-0005wn-Jw
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 09:15:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZUaYS-0005qQ-Vf
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 09:15:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZUaYS-0007Rg-2a
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 09:15:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZUaY9-0007NB-W9; Wed, 26 Aug 2015 09:15:34 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 24DFBAB9;
	Wed, 26 Aug 2015 13:15:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-105.ams2.redhat.com
	[10.36.116.105])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QDFVen003243
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Aug 2015 09:15:32 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E54FB303F90B; Wed, 26 Aug 2015 15:15:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <cff8241a8e30f0d39e0f50a435965cdd130cd5d5.1436279924.git.DirtY.iCE.hu@gmail.com>
	<CAJSP0QXj07FKi9g0B6mF9nbZi-inPQMEFrVZ_a6w5WPwbJycLQ@mail.gmail.com>
Date: Wed, 26 Aug 2015 15:15:30 +0200
In-Reply-To: <CAJSP0QXj07FKi9g0B6mF9nbZi-inPQMEFrVZ_a6w5WPwbJycLQ@mail.gmail.com>
	(Stefan Hajnoczi's message of "Tue, 28 Jul 2015 13:30:43 +0100")
Message-ID: <878u8ynqbx.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	=?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] opts: produce valid
	command line in qemu_opts_print
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
X-List-Received-Date: Wed, 26 Aug 2015 13:15:56 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Tue, Jul 7, 2015 at 3:42 PM, K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty=
.ice.hu@gmail.com> wrote:
>> This will let us print options in a format that the user would actually
>> write it on the command line (foo=3Dbar,baz=3Dasd,etc=3Ddef), without
>> prepending a spurious comma at the beginning of the list, or quoting
>> values unnecessarily.  This patch provides the following changes:
>> * write and id=3D, if the option has an id
>> * do not print separator before the first element
>> * do not quote string arguments
>> * properly escape commas (,) for QEMU
>>
>> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.co=
m>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> Feel free to send a "Ping" email reply if your patches haven't been
> reviewed after about 1 week.
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Route via qemu-trivial or qemu-block?

