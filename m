Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNms5-0000no-J6
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 09:41:53 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RNms3-0000mn-53
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:41:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RNmrv-0007yi-6e
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:41:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59557)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1RNmru-0007yZ-VG; Tue, 08 Nov 2011 09:41:43 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA8EfbsZ006082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 8 Nov 2011 09:41:37 -0500
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pA8EfYqi014819
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Nov 2011 09:41:36 -0500
Message-ID: <4EB9405D.60008@redhat.com>
Date: Tue, 08 Nov 2011 15:44:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: =?UTF-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
References: <1320756321-8059-1-git-send-email-armbru@redhat.com>
	<CAJSP0QXBVX-Tmg9+nJbCo6vVGarDgaPOe7rtR7Z0WVwD+np0_g@mail.gmail.com>
	<m3bosmu1wd.fsf@blackfin.pond.sub.org>
	<20111108143435.GA51305@cs.nctu.edu.tw>
In-Reply-To: <20111108143435.GA51305@cs.nctu.edu.tw>
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	pA8EfbsZ006082
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] ui/vnc: Convert
 sasl.mechlist to g_malloc() & friends
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
X-List-Received-Date: Tue, 08 Nov 2011 14:41:52 -0000

Am 08.11.2011 15:34, schrieb =E9=99=B3=E9=9F=8B=E4=BB=BB:
>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>
>>> On Tue, Nov 8, 2011 at 12:45 PM, Markus Armbruster <armbru@redhat.com=
> wrote:
>>>> Fixes protocol_client_auth_sasl_mechname() not to crash when malloc(=
)
>>>> fails.  Spotted by Coverity.
>>>> ---
>>>>  ui/vnc-auth-sasl.c |   19 +++++--------------
>>>>  1 files changed, 5 insertions(+), 14 deletions(-)
>>>
>>> Looks good, please add Signed-off-by.
>>
>> Gaa, too trivial to get it right in less than three tries!  There must=
 a
>> curse of brainlessness on this one...
>=20
>   `git-format-patch -s` will generate the sign-off-by.

And git commit -s will make sure that it doesn't disappear in v2 when it
was there in v1.

Kevin

