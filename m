Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYaM-000363-5c
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 04:16:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aIYaJ-00035Z-MW
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:16:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aIYaE-0008VH-Ng
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:16:19 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:36059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aIYaE-0008VD-Gd; Mon, 11 Jan 2016 04:16:14 -0500
Received: by mail-wm0-x232.google.com with SMTP id l65so202455614wmf.1;
	Mon, 11 Jan 2016 01:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=UU3iIggKaeeU4BXmmOkvR9txosCcic89MI3ZRPElDY8=;
	b=nDmDwrvenl9zH5tKJnQgQh04Ylim750/x4tMnNBoSRQlTwaHesTBT8JD4AruzjObH4
	HSfeClDGO+dajg5jTnXFxB1bugG6uu+qPYt47sXqj2VOgJTIuWtu2+WzvJVnzqsj9kJg
	kjZ5VxE52r1dtXJ1FLyC1cI6Q/oVKr6KzNI+6myLbGAGNNFzX/AX24/7QznBMUVEKwVR
	7Rtco0VeePlfs1Zt77/+v2CFYsC67LYpIElA1AekTgwOsFsnx+Rdh8lE8/oCK4qUGmD6
	dZMNVaxyB3c2Brh4Hjqve4JGVA8HF0mB3naPyIwlkrBM3mFbxRg8aC6E0150Ow731Jk/
	BMaA==
X-Received: by 10.194.79.8 with SMTP id f8mr134661091wjx.6.1452503774037;
	Mon, 11 Jan 2016 01:16:14 -0800 (PST)
Received: from [192.168.10.165] (94-39-195-126.adsl-ull.clienti.tiscali.it.
	[94.39.195.126]) by smtp.googlemail.com with ESMTPSA id
	dl8sm118867921wjb.29.2016.01.11.01.16.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 01:16:13 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Ashley Jonathan <jonathan.ashley@altran.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <AC19797808C8D548ABDE0CA4A97AA30A30DEB409@XMB-DCFR-37.europe.corp.altran.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <569372DC.5020606@redhat.com>
Date: Mon, 11 Jan 2016 10:16:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <AC19797808C8D548ABDE0CA4A97AA30A30DEB409@XMB-DCFR-37.europe.corp.altran.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
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
X-List-Received-Date: Mon, 11 Jan 2016 09:16:20 -0000



On 11/12/2015 12:29, Ashley Jonathan wrote:
> I have experienced a minor difficulty using QEMU with the "-serial
> pty" option:
> 
> If a process opens the slave pts device, writes data to it, then
> immediately closes it, the data doesn't reliably get delivered to the
> emulated serial port. This seems to be because a read of the master
> pty device returns EIO on Linux if no process has the pts device
> open, even when data is waiting "in the pipe".
> 
> A fix seems to be for QEMU to keep the pts file descriptor open until
> the pty is closed, as per the below patch.

You need to include a "Signed-off-by: Ashley Jonathan <jonathan.ashley@altran.com>"
line in the commit message, meaning that you have read and understood the
"Developer Certificate of Origin":

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297

Just reply to this message with the above line.

Paolo

