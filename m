Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wy5Zw-0005Xd-OL
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jun 2014 16:38:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1Wy5Zu-0005Vb-V1
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 16:38:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1Wy5Zu-0000Mq-7a
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 16:38:30 -0400
Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233]:51535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1Wy5Zs-0000GO-5k; Fri, 20 Jun 2014 16:38:28 -0400
Received: by mail-qg0-f51.google.com with SMTP id z60so3956197qgd.10
	for <multiple recipients>; Fri, 20 Jun 2014 13:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=3iqPeDmlm9PPejZN2bV1+O2FIjhnk1wNRety8ClaXtY=;
	b=eyRID3GVuMTRLka1eaNXVTqEItIr+Fobdcboe1NNzXyKOvAD+caX8ctSAw3VpZdWDZ
	m1B6nHoXBMhb4MxOzW1HcEap+iAlrX8sGO2yR7XrAYiF7HWVjfkCsb8mBjXe3EEX6T56
	M+FTis3UPkvE/QU/5cJc7XvZf2mjS9BnLiOFELAqXT4aRyR47zv3OpgBfEJqEC9oFW6n
	/oZAK2pLTkIr3+3FT+L4PN6DYD+cEHKh8fOU1qvTXxMBkV/JlOM5plKJ9C2T48IowigB
	GHy1udl5zjST4mNdWurMjmMQ9chiT0mI/5+uxQnTRk6PiEWN1CnXKeZ0KctzcBrd8EO0
	THlg==
MIME-Version: 1.0
X-Received: by 10.140.48.45 with SMTP id n42mr8599350qga.107.1403296707354;
	Fri, 20 Jun 2014 13:38:27 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.140.49.239 with HTTP; Fri, 20 Jun 2014 13:38:27 -0700 (PDT)
In-Reply-To: <53A1AECE.9000508@suse.de>
References: <1403096280-68774-1-git-send-email-emaste@freebsd.org>
	<53A1A52D.1090107@redhat.com> <53A1AECE.9000508@suse.de>
Date: Fri, 20 Jun 2014 16:38:27 -0400
X-Google-Sender-Auth: L4Yg4cSqvYWIijlTab1wxflyW1A
Message-ID: <CAPyFy2DY7AgfMd+uUV4UTk=M88EAg-NGcghRUGSNF5f1LCDYTw@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::233
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Alon Levy <alevy@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vscclient: Add required
 headers to fix build on FreeBSD
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
X-List-Received-Date: Fri, 20 Jun 2014 20:38:31 -0000

On 18 June 2014 11:22, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> Am 18.06.2014 16:41, schrieb Paolo Bonzini:
>> Il 18/06/2014 14:58, Ed Maste ha scritto:
>>> Signed-off-by: Ed Maste <emaste@freebsd.org>
>>> ---
>>>  libcacard/vscclient.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
>>> index ab9b2b8..80111df 100644
>>> --- a/libcacard/vscclient.c
>>> +++ b/libcacard/vscclient.c
>>> @@ -11,6 +11,8 @@
>>>   */
>>>
>>>  #ifndef _WIN32
>>> +#include <sys/socket.h>
>>> +#include <netinet/in.h>
>>>  #include <netdb.h>
>>>  #define closesocket(x) close(x)
>>>  #endif
>>>
>>
>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Looks okay, CC'ing Alon and -trivial.

Ping - can we bring in this build fix other than by waiting on -trivial?

