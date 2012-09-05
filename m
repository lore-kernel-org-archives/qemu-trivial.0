Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9HtX-0004au-Fc
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 11:51:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9HtQ-0004Gw-QW
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 11:51:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9HtP-0000lj-Q3
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 11:51:52 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:33235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1T9HtA-0000io-1d; Wed, 05 Sep 2012 11:51:36 -0400
Received: by lbbgm13 with SMTP id gm13so445907lbb.4
	for <multiple recipients>; Wed, 05 Sep 2012 08:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=r9/dSUrfZU+yiRn5EGxtIeYCDde0+1CPsg803qD1+K4=;
	b=kCFA+sW+Oq4TlnM6X1Wnbj0vmYWRqZBeCTEnxNO29L5hw9Dbje3GKyuHz+hipSzd+B
	ieuwLauCsgBeNsufxU94xkWsGhKHDYFJD98tHP2aIVDi9vkag8kQ7B+4YC5ERP6XPrKx
	itf3AuG9u6zmwWHUL5iLQhKcixhAb4RBgkN5TSQBcW1gRrnAzJAfULFkyNUwDjSfgrU1
	H1jy17AMCa4JKxvAVhUYdIZDC/jM6NGyDzS33SuIVI8kdWVrNs4pd+db/F8PDUuo6tbQ
	yupGTTF0wXhHs7yFVngkNTNMTkcxSh9lLYkNE0/pRxhjEQ5YiTdEh8hRk1dhiYGIOUdt
	+BYA==
MIME-Version: 1.0
Received: by 10.112.86.102 with SMTP id o6mr7605601lbz.113.1346860294374; Wed,
	05 Sep 2012 08:51:34 -0700 (PDT)
Received: by 10.112.5.6 with HTTP; Wed, 5 Sep 2012 08:51:34 -0700 (PDT)
In-Reply-To: <50477269.8050807@redhat.com>
References: <1346851582-9296-1-git-send-email-riegamaths@gmail.com>
	<50477269.8050807@redhat.com>
Date: Wed, 5 Sep 2012 23:51:34 +0800
Message-ID: <CAOZVR5bcX-CoJW=kgmB_OJh+H1L8iTBPm2CoFE+xVNXfGvfW0A@mail.gmail.com>
From: Dunrong Huang <riegamaths@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] block: Don't forget to delete temporary
	file
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
X-List-Received-Date: Wed, 05 Sep 2012 15:51:57 -0000

Hi, thanks for you reply.
2012/9/5 Paolo Bonzini <pbonzini@redhat.com>:
> Il 05/09/2012 15:26, riegamaths@gmail.com ha scritto:
>> From: Dunrong Huang <riegamaths@gmail.com>
>>
>> The caller would not delete temporary file after failed get_tmp_filename=
().
>>
>> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
>> ---
>>  block.c | 6 +++++-
>>  1 =B8=F6=CE=C4=BC=FE=B1=BB=D0=DE=B8=C4=A3=AC=B2=E5=C8=EB 5 =D0=D0(+)=A3=
=AC=C9=BE=B3=FD 1 =D0=D0(-)
>>
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
>>
>
> Not necessary, mkstemp will not create a file if it returns an error.
>
If we call mkstemp() successfully, but failed to close(fd),
in this case, the temporafy file will not be deleted even if QEMU exits.
> Paolo



--=20
Best Regards,

Dunrong Huang

