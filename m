Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9I4L-0002Ag-S2
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 12:03:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1T9I4E-0001pK-31
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 12:03:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1T9I4D-000435-3k
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 12:03:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1T9I3z-00041t-Gm; Wed, 05 Sep 2012 12:02:47 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q85G2j43022923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 5 Sep 2012 12:02:45 -0400
Received: from blackfin.pond.sub.org (ovpn-116-64.ams2.redhat.com
	[10.36.116.64])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q85G2iMX006444; Wed, 5 Sep 2012 12:02:44 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9616820063; Wed,  5 Sep 2012 18:02:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1346851582-9296-1-git-send-email-riegamaths@gmail.com>
	<50477269.8050807@redhat.com>
Date: Wed, 05 Sep 2012 18:02:43 +0200
In-Reply-To: <50477269.8050807@redhat.com> (Paolo Bonzini's message of "Wed,
	05 Sep 2012 17:40:25 +0200")
Message-ID: <87d320e9uk.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	riegamaths@gmail.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Don't forget to
	delete temporary file
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
X-List-Received-Date: Wed, 05 Sep 2012 16:03:07 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il 05/09/2012 15:26, riegamaths@gmail.com ha scritto:
>> From: Dunrong Huang <riegamaths@gmail.com>
>>=20
>> The caller would not delete temporary file after failed get_tmp_filename=
().
>>=20
>> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
>> ---
>>  block.c | 6 +++++-
>>  1 =E4=B8=AA=E6=96=87=E4=BB=B6=E8=A2=AB=E4=BF=AE=E6=94=B9=EF=BC=8C=E6=8F=
=92=E5=85=A5 5 =E8=A1=8C(+)=EF=BC=8C=E5=88=A0=E9=99=A4 1 =E8=A1=8C(-)
>>=20
>> diff --git a/block.c b/block.c
>> index 074987e..2bc9f75 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -433,7 +433,11 @@ int get_tmp_filename(char *filename, int size)
>>          return -EOVERFLOW;
>>      }
>>      fd =3D mkstemp(filename);
>> -    if (fd < 0 || close(fd)) {
>> +    if (fd < 0) {
>> +        return -errno;
>> +    }
>> +    if (close(fd) !=3D 0) {
>> +        unlink(filename);
>>          return -errno;
>>      }
>>      return 0;
>>=20
>
> Not necessary, mkstemp will not create a file if it returns an error.

Read the patch once more :)

