Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y68X2-0004WK-EA
	for mharc-qemu-trivial@gnu.org; Tue, 30 Dec 2014 20:57:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dslutz@verizon.com>) id 1Y68X0-0004Sx-FF
	for qemu-trivial@nongnu.org; Tue, 30 Dec 2014 20:57:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dslutz@verizon.com>) id 1Y68Wz-0002gc-C7
	for qemu-trivial@nongnu.org; Tue, 30 Dec 2014 20:57:02 -0500
Received: from omzsmtpe04.verizonbusiness.com ([199.249.25.207]:20475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dslutz@verizon.com>)
	id 1Y68Wu-0002ek-UX; Tue, 30 Dec 2014 20:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=verizon.com; i=dslutz@verizon.com; q=dns/txt; s=corp;
	t=1419991016; x=1451527016;
	h=from:message-id:date:mime-version:to:cc:subject:
	references:in-reply-to:content-transfer-encoding;
	bh=wLnCg6zQC/VsPlKGaY4Km8lgSb9LGRsryRDnf9DMjFg=;
	b=CncuGG1lTnrWeWCEdMJ2QJ7odKsRBhOus6zRlwhHo/+AdAil+fyQvLs8
	W/kFpZwC5gBtjRvrMxIlIMyFusvYPyPHmI0DUG0+0KzW4S9TikBGeMqtX
	vRttSLbB+RUp/0oOWlYPDTXojk6ntkt4hEUzKNJAazdxKMV5tPjr6EFAC Q=;
X-IronPort-Anti-Spam-Filtered: false
Received: from unknown (HELO fldsmtpi03.verizon.com) ([166.68.71.145])
	by omzsmtpe04.verizonbusiness.com with ESMTP; 31 Dec 2014 01:56:54 +0000
From: Don Slutz <dslutz@verizon.com>
X-VzAPP: 1
X-IronPort-AV: E=Sophos;i="5.07,669,1413244800"; d="scan'208";a="904499654"
Received: from unknown (HELO don-lt.don.CloudSwitch.com) ([70.105.108.80])
	by fldsmtpi03.verizon.com with ESMTP; 31 Dec 2014 01:56:52 +0000
Message-ID: <54A357E4.6080103@terremark.com>
Date: Tue, 30 Dec 2014 20:56:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1419260640-2922-1-git-send-email-dslutz@verizon.com>
	<54A125E6.4050807@msgid.tls.msk.ru> <54A1B945.20509@terremark.com>
	<CAFEAcA-GjRku9rRZr04itDx-bB40=DpdLNf9_V8QfHANiit4GA@mail.gmail.com>
In-Reply-To: <CAFEAcA-GjRku9rRZr04itDx-bB40=DpdLNf9_V8QfHANiit4GA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 199.249.25.207
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>, Don Slutz <dslutz@verizon.com>,
	Anthony Liguori <aliguori@amazon.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] Do not hang on full PTY
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
X-List-Received-Date: Wed, 31 Dec 2014 01:57:03 -0000

On 12/29/14 18:41, Peter Maydell wrote:
> On 29 December 2014 at 20:27, Don Slutz <dslutz@verizon.com> wrote:
>> I was not sure on this being trivial also, but it looked like it could
>> be to me.  The uses of this FD all looked that they handle non-blocking.
> Does g_io_channel_read_chars() definitely return G_IO_STATUS_NORMAL
> (and not, say, G_IO_STATUS_AGAIN) for an attempted read on a non-blocking
> fd with no data?

The only time I know of to get here in that state, is when the other end 
disconnects.
Normally pty_chr_read will only be called when there is at least 1 
character to read or
a state change.

>   Otherwise pty_chr_read() is going to call
> pty_chr_state(chr, 0) which I think means "the other end has hung up"
> and will take the fd out of the main loop's poll set.

Yes, that is correct.  But it only happens when the other end disconnects.
pty_chr_timer() also is involved here, so on a reconnect, the polling is 
re-enabled.

    -Don Slutz

>
> thanks
> -- PMM


