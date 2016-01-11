Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYXp-00022j-9O
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 04:13:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aIYXn-00022a-Ly
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:13:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aIYXi-00082F-MI
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:13:43 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:34010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aIYXi-00082B-FX; Mon, 11 Jan 2016 04:13:38 -0500
Received: by mail-wm0-x22a.google.com with SMTP id u188so205633280wmu.1;
	Mon, 11 Jan 2016 01:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=6WUWuxGXHi0UeAcdGvXYUKCrlgjg2qn5EmIy58RNagY=;
	b=gCsJDBDKYgGTX6/wJtSqeI+ry/ZhF5A3GXUWqtMah4pVKXTVo28p8B0+yYbC62oWT8
	Q/8hU7zpVTQUiTRIgPC7cZq7KVovO/tGrMfuYodjUG9LrKYJVsefi01oTMCL4CUcFryv
	0mAh2mbh1+0zv1neOjD/kzDGEwr1w8SffinkLsSVzbSnlh7Z+eR6ktLBU5rGKy1IwOrF
	ZM4S/EC4d8sVHufvRHKyFPFlpOOQzvlXvFD5dw/R8NeX1AwyJcoIO9L4hbXewEz1hgf0
	6Dy6dFLEZQ8HeC4vjcjL8s0C7YEyoanJiqyQ5WSowHeoUHpvr3UzcNtdetge7eWGswok
	4FJQ==
X-Received: by 10.28.225.8 with SMTP id y8mr12882159wmg.98.1452503618002;
	Mon, 11 Jan 2016 01:13:38 -0800 (PST)
Received: from [192.168.10.165] (94-39-195-126.adsl-ull.clienti.tiscali.it.
	[94.39.195.126]) by smtp.googlemail.com with ESMTPSA id
	c26sm11824959wmi.21.2016.01.11.01.13.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 01:13:36 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
	Ashley Jonathan <jonathan.ashley@altran.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <AC19797808C8D548ABDE0CA4A97AA30A30DEB409@XMB-DCFR-37.europe.corp.altran.com>
	<569368F6.3050704@msgid.tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56937240.2080305@redhat.com>
Date: Mon, 11 Jan 2016 10:13:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <569368F6.3050704@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Keep pty slave file descriptor open
 until the master is closed
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
X-List-Received-Date: Mon, 11 Jan 2016 09:13:44 -0000



On 11/01/2016 09:33, Michael Tokarev wrote:
> 11.12.2015 14:29, Ashley Jonathan wrote:
>> I have experienced a minor difficulty using QEMU with the "-serial pty" option:
>>
>> If a process opens the slave pts device, writes data to it, then immediately closes it, the data doesn't reliably get delivered to the emulated serial port. This seems to be because a read of the master pty device returns EIO on Linux if no process has the pts device open, even when data is waiting "in the pipe".
>>
>> A fix seems to be for QEMU to keep the pts file descriptor open until the pty is closed, as per the below patch.
> 
> The patch looks fine, so
> 
> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> but I'd love to have an ACK from the maintainer about this one,
> or for it to pick it up.

Ok, I'll pick it up after I've read up a bit more on PTYs.

Paolo

