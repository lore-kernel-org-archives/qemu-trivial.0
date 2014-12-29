Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y5gvA-0003Dq-Fh
	for mharc-qemu-trivial@gnu.org; Mon, 29 Dec 2014 15:28:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dslutz@verizon.com>) id 1Y5gv7-00039a-Bu
	for qemu-trivial@nongnu.org; Mon, 29 Dec 2014 15:28:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dslutz@verizon.com>) id 1Y5gv1-0001QD-3I
	for qemu-trivial@nongnu.org; Mon, 29 Dec 2014 15:28:05 -0500
Received: from omzsmtpe04.verizonbusiness.com ([199.249.25.207]:54316)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dslutz@verizon.com>)
	id 1Y5gv0-0001P9-Tz; Mon, 29 Dec 2014 15:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=verizon.com; i=dslutz@verizon.com; q=dns/txt; s=corp;
	t=1419884878; x=1451420878;
	h=from:message-id:date:mime-version:to:cc:subject:
	references:in-reply-to:content-transfer-encoding;
	bh=7hwrQGJAC+wtT5LE1PtUg7zuJeOJwHTw7s/q4anET7I=;
	b=utLI2BHNCleDHESLJPlcmm/GJUQ2yWigbFWTbjSD6DY8dFO9X6nJ8YQh
	lqlWmPMZDG1AAoXo7IXHKRwwpV1JVNllOpmHouv0EQ4ep/X7l3pfGfFzk
	VeWxBgEl93JToEhe1P1WvWMYBd3PpnV28JISA/37QOCkmwoRRS+ijxmvk 8=;
X-IronPort-Anti-Spam-Filtered: false
Received: from unknown (HELO fldsmtpi01.verizon.com) ([166.68.71.143])
	by omzsmtpe04.verizonbusiness.com with ESMTP; 29 Dec 2014 20:27:50 +0000
From: Don Slutz <dslutz@verizon.com>
X-VzAPP: 1
X-IronPort-AV: E=Sophos;i="5.07,660,1413244800"; d="scan'208";a="940956465"
Received: from unknown (HELO don-760.CloudSwitch.com) ([70.105.111.51])
	by fldsmtpi01.verizon.com with ESMTP; 29 Dec 2014 20:27:49 +0000
Message-ID: <54A1B945.20509@terremark.com>
Date: Mon, 29 Dec 2014 15:27:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Don Slutz <dslutz@verizon.com>, 
	qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1419260640-2922-1-git-send-email-dslutz@verizon.com>
	<54A125E6.4050807@msgid.tls.msk.ru>
In-Reply-To: <54A125E6.4050807@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 199.249.25.207
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH 1/1] Do not hang on full PTY
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
X-List-Received-Date: Mon, 29 Dec 2014 20:28:06 -0000

On 12/29/14 04:59, Michael Tokarev wrote:
> 22.12.2014 18:04, Don Slutz wrote:
> 
>> --- a/qemu-char.c
>> +++ b/qemu-char.c
>> @@ -1387,6 +1387,7 @@ static CharDriverState *qemu_chr_open_pty(const char *id,
>>      }
>>  
>>      close(slave_fd);
>> +    qemu_set_nonblock(master_fd);
>>  
>>      chr = qemu_chr_alloc();
> 
> 
> Hm.  I'm not sure at all this is a trivial change.  While the
> patch itself is trivial indeed, it changes behavour of the file
> descriptor significantly.  Are all the places where this fd is
> subsequently used prepared for it being non-blocking?  Oh well... ;)

I was not sure on this being trivial also, but it looked like it could
be to me.  The uses of this FD all looked that they handle non-blocking.

Here are the calls to qemu_set_nonblock in qemu-char.c (including this
add) :

b qemu-char.c             qemu_chr_open_fd           1070
qemu_set_nonblock(fd_out);
c qemu-char.c             qemu_chr_open_stdio        1166
qemu_set_nonblock(0);
d qemu-char.c             qemu_chr_open_pty          1390
qemu_set_nonblock(master_fd);
e qemu-char.c             tcp_chr_add_client         2952
qemu_set_nonblock(fd);
f qemu-char.c             qmp_chardev_open_serial    4060
qemu_set_nonblock(fd);
g qemu-char.c             qmp_chardev_open_socket    4172
qemu_set_nonblock(s->listen_fd);

So there are many cases where the FD is non-blocking already.

Hope this info helps.

> 
> Thanks,
> 
> /mjt
> 

