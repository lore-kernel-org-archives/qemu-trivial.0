Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJLFq-0001gD-2o
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 07:37:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLFj-0001Ua-00
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLFe-0006Tk-Ki
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:37:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54546)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XJLFV-0006Oh-CF; Mon, 18 Aug 2014 07:37:17 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 956C9437F7;
	Mon, 18 Aug 2014 15:37:16 +0400 (MSK)
Message-ID: <53F1E56C.9000709@msgid.tls.msk.ru>
Date: Mon, 18 Aug 2014 15:37:16 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Marcel Apfelbaum <marcel.a@redhat.com>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408353202.4964.2.camel@localhost.localdomain>
In-Reply-To: <1408353202.4964.2.camel@localhost.localdomain>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: mst@redhat.com, qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v7] tests/bios-tables-test: check the
 value returned by fopen()
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
X-List-Received-Date: Mon, 18 Aug 2014 11:37:35 -0000

18.08.2014 13:13, Marcel Apfelbaum wrote:
> On Mon, 2014-08-18 at 15:54 +0800, zhanghailiang wrote:
>> The function fopen() may fail, so check its return value.
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> Signed-off-by: Li Liu <john.liuli@huawei.com>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/bios-tables-test.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
>> index 045eb27..feb3b58 100644
>> --- a/tests/bios-tables-test.c
>> +++ b/tests/bios-tables-test.c
>> @@ -790,6 +790,11 @@ int main(int argc, char *argv[])
>>      const char *arch =3D qtest_get_arch();
>>      FILE *f =3D fopen(disk, "w");
>>      int ret;
>> +
>> +    if (!f) {
>> +        fprintf(stderr, "Couldn't open \"%s\": %s", disk, strerror(er=
rno));
>> +        return -1;
>> +    }
> Hi,
> I think we should use an assert here, we need an indication
> that the test failed and a print to stderr is not enough.

Guys, please stop misusing (or trying to misuse) assert().  assert() is f=
or
code path which are impossible by program logic.  Here, it is a error che=
ck,
not a code logic check -- the fopen() _may_ fail, and this is not somethi=
ng
the code around makes impossible.  So in cases like this (and in other si=
milar
case like vvfat.log open check), we should either print to stderr and exi=
t,
or print elsewhere, but we should NOT use assert().  Think what will be i=
f
the program will be compiled with -D_NDEBUG and all assert()s are turned =
into
a no-op.

So, no assert() in cases like this here and elsewhere (not only in qemu).=
 It
is not what assert() is provided for.

Thanks,

/mjt

