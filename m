Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNmch-0005PE-8E
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 09:25:59 -0500
Received: from eggs.gnu.org ([140.186.70.92]:59732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RNmcf-0005It-Gr
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:25:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RNmca-00049p-9r
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:25:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:25060)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1RNmcQ-00048f-CP; Tue, 08 Nov 2011 09:25:42 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA8EPdvE032519
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 8 Nov 2011 09:25:39 -0500
Received: from blackfin.pond.sub.org (ovpn-116-20.ams2.redhat.com
	[10.36.116.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA8EPc3x025506; Tue, 8 Nov 2011 09:25:39 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 31C1C6006D; Tue,  8 Nov 2011 15:25:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1320756321-8059-1-git-send-email-armbru@redhat.com>
	<CAJSP0QXBVX-Tmg9+nJbCo6vVGarDgaPOe7rtR7Z0WVwD+np0_g@mail.gmail.com>
Date: Tue, 08 Nov 2011 15:25:38 +0100
In-Reply-To: <CAJSP0QXBVX-Tmg9+nJbCo6vVGarDgaPOe7rtR7Z0WVwD+np0_g@mail.gmail.com>
	(Stefan Hajnoczi's message of "Tue, 8 Nov 2011 13:14:32 +0000")
Message-ID: <m3bosmu1wd.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, berrange@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] ui/vnc: Convert sasl.mechlist to
	g_malloc() & friends
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
X-List-Received-Date: Tue, 08 Nov 2011 14:25:58 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Tue, Nov 8, 2011 at 12:45 PM, Markus Armbruster <armbru@redhat.com> wr=
ote:
>> Fixes protocol_client_auth_sasl_mechname() not to crash when malloc()
>> fails. =C2=A0Spotted by Coverity.
>> ---
>> =C2=A0ui/vnc-auth-sasl.c | =C2=A0 19 +++++--------------
>> =C2=A01 files changed, 5 insertions(+), 14 deletions(-)
>
> Looks good, please add Signed-off-by.

Gaa, too trivial to get it right in less than three tries!  There must a
curse of brainlessness on this one...

