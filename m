Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9UtJ-0005Ed-Js
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 02:49:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1V9LjH-0001rj-HM
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 17:02:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1V9LjE-0005fk-U0
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 17:02:11 -0400
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232]:45349)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>)
	id 1V9Lj8-0005dg-FH; Tue, 13 Aug 2013 17:02:02 -0400
Received: by mail-wi0-f178.google.com with SMTP id j17so1170400wiw.5
	for <multiple recipients>; Tue, 13 Aug 2013 14:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QyBaVrQr32YpG2FfP8H8bgbyehmYN2BZIpJsVAOB6uw=;
	b=xo5siGE3dOxl3daeoIqHOsWLtgH/LaY7oSUT2yqME8a20hqMdHsVdnY0yTqFPr3sZ+
	bQ/W6adySV9SzVJw+vDUr1KnJPYvcyvudw1Oue5plytKutPLl3O2gwoFSy1XO3xoRBGL
	trCaZsBcRLrkj+ob/4hEYkkkB9z4mVRyAme4L2Wxpp4C5LUuA2BeSuQpSZMzUvFfVkvY
	DxlTmFy4bXHV2KFKq6NOMEu9WyCY/4jLj/STMeHTr2Ssvb8UX+CjM0aKEqR3/9StufBg
	T6nc7ZNZ5RA+ihD51QyxJciPLQmu/zlc5eIyNvpzzzH3Ljyax29/DI205IWTvnbea0Du
	mGwQ==
MIME-Version: 1.0
X-Received: by 10.180.77.164 with SMTP id t4mr3840456wiw.58.1376427721531;
	Tue, 13 Aug 2013 14:02:01 -0700 (PDT)
Received: by 10.194.24.161 with HTTP; Tue, 13 Aug 2013 14:02:01 -0700 (PDT)
In-Reply-To: <520A9563.20307@weilnetz.de>
References: <1376424027-26208-1-git-send-email-tmirza@codesourcery.com>
	<520A9563.20307@weilnetz.de>
Date: Wed, 14 Aug 2013 02:02:01 +0500
Message-ID: <CAO6-N=YzHkbOeuqkA6a5JYbmL_7cEmBdyDAOXa+hzM1xxTJ-sw@mail.gmail.com>
From: Taimoor Mirza <taimoor.mrza@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::232
X-Mailman-Approved-At: Wed, 14 Aug 2013 02:49:08 -0400
Cc: qemu-trivial@nongnu.org, Taimoor Mirza <tmirza@codesourcery.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Port redirection
 option behave differently on Linux and Windows
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
X-List-Received-Date: Tue, 13 Aug 2013 21:02:14 -0000

Thanks for reviewing the patch

On Wed, Aug 14, 2013 at 1:21 AM, Stefan Weil <sw@weilnetz.de> wrote:
> Am 13.08.2013 22:00, schrieb Taimoor:
>> From: Taimoor Mirza <tmirza@codesourcery.com>
>>
>> port redirection code uses SO_REUSEADDR socket option before binding to
>> host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
>> Relaunching QEMU with same host and guest port redirection values on Linux
>> throws error but on Windows it does not throw any error.
>> Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html
>>
>> Signed-off-by: Taimoor Mirza <tmirza@codesourcery.com>
>> ---
>>  slirp/socket.c |    2 ++
>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/slirp/socket.c b/slirp/socket.c
>> index 8e8819c..23780b3 100644
>> --- a/slirp/socket.c
>> +++ b/slirp/socket.c
>> @@ -627,7 +627,9 @@ tcp_listen(Slirp *slirp, uint32_t haddr, u_int hport, uint32_t laddr,
>>       addr.sin_port = hport;
>>
>>       if (((s = qemu_socket(AF_INET,SOCK_STREAM,0)) < 0) ||
>> +#ifdef _WIN32
>
> Shouldn't this be replaced by #ifndef _WIN32?
Yes it should be. I am resending the patch
>
>>           (qemu_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(int)) < 0) ||
>> +#endif
>>           (bind(s,(struct sockaddr *)&addr, sizeof(addr)) < 0) ||
>>           (listen(s,1) < 0)) {
>>               int tmperrno = errno; /* Don't clobber the real reason we failed */
>

-Taimoor

