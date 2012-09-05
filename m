Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9Cy0-00024V-Bf
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 06:36:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1T9Cxt-00024F-GI
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 06:36:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1T9Cxn-0004Lz-JG
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 06:36:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1T9Cxn-0004KJ-9n; Wed, 05 Sep 2012 06:36:03 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q85Aa1pm029968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 5 Sep 2012 06:36:01 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q85AZwdB002920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 5 Sep 2012 06:36:00 -0400
Message-ID: <50472B0E.4080205@redhat.com>
Date: Wed, 05 Sep 2012 12:35:58 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1346833574-26193-1-git-send-email-riegamaths@gmail.com>
	<20120905094003.GD4786@stefanha-thinkpad.localdomain>
In-Reply-To: <20120905094003.GD4786@stefanha-thinkpad.localdomain>
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	q85Aa1pm029968
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	riegamaths@gmail.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: output more error
 messages if failed to create temporary snapshot
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
X-List-Received-Date: Wed, 05 Sep 2012 10:36:15 -0000

Am 05.09.2012 11:40, schrieb Stefan Hajnoczi:
> On Wed, Sep 05, 2012 at 04:26:14PM +0800, riegamaths@gmail.com wrote:
>> From: Dunrong Huang <riegamaths@gmail.com>
>>
>> If we failed to create temporary snapshot, the error message did not m=
atch
>> with the error, for example:
>>
>> $ TMPDIR=3D/tmp/bad_path qemu-system-x86_64 -enable-kvm debian.qcow2 -=
snapshot
>> qemu-system-x86_64: -enable-kvm: could not open disk image /home/maths=
linux/Images/debian.qcow2: No such file or directory
>>
>> Indeed, the file which cant be created is /tmp/bad_path/vl.xxxxxx,  no=
t
>> debian.qcow2. so the error message makes users feel confused.
>>
>> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
>> ---
>>  block.c | 2 ++
>>  1 =E4=B8=AA=E6=96=87=E4=BB=B6=E8=A2=AB=E4=BF=AE=E6=94=B9=EF=BC=8C=E6=8F=
=92=E5=85=A5 2 =E8=A1=8C(+)
>>
>> diff --git a/block.c b/block.c
>> index 470bdcc..c9e5140 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -434,6 +434,8 @@ int get_tmp_filename(char *filename, int size)
>>      }
>>      fd =3D mkstemp(filename);
>>      if (fd < 0 || close(fd)) {
>> +        fprintf(stderr, "Could not create temporary snapshot in %s di=
rectory: "
>> +                "%s\n", tmpdir, strerror(errno));
>=20
> The error message is fine for fd < 0 but not for close(0) !=3D 0.  Also=
,
> close(2) is allowed to change errno (even on success) so this is not
> portable and could clobber the errno value.

I don't think this error message is fine in get_tmp_filename(). This
function happens to be used for temporary snapshots, but this is not
part of its interface. Today it's also used in vvfat and there the
message would only be confusing. Other use cases may be introduced in
the future.

If you want to introduce an error message, do it in the caller.

Kevin

