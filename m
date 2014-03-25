Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WSQWm-0006CG-Iw
	for mharc-qemu-trivial@gnu.org; Tue, 25 Mar 2014 08:32:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WSQWg-00063x-8i
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 08:32:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WSQWa-0004Va-QC
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 08:32:18 -0400
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233]:57593)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1WSQWP-0004SI-FU; Tue, 25 Mar 2014 08:32:01 -0400
Received: by mail-wi0-f179.google.com with SMTP id f8so551132wiw.6
	for <multiple recipients>; Tue, 25 Mar 2014 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LZhKPhBFR2gZDWPyB2tdovXlpWXZPaCuRrhWPA8bRf8=;
	b=OwlWBsAF6Bf5kOHHRt7wM+03wEDEWlzZvmQLwRMXn12ngXSHT7UzBmKI6r5hlKggcM
	dgOcosfM4MSl48okJzyVPp23ghDGHDFFE4clOUiCqqjS3080ivX9d+TO76pl6F7rM+WG
	KJlc79eekJV0BbVMk0kT7ovMTdqAWQRODMwLxEZOD04MD4yZbYXTDUiaf4BLj5xGJOFT
	WaVYKLAJW4QE5JuGRbh+CtcOLEVA3cnL0N1HmH+8HrtbCDkchHUZHrNChyOmh1Y9msbQ
	f/3qtDVCatWdhTcHo/w9A3v5SLET5wVV4ZNHQIF+sNfbz+7WFvpHjhJjgPfh7TUBe6DX
	479A==
X-Received: by 10.180.97.72 with SMTP id dy8mr21505793wib.5.1395750720054;
	Tue, 25 Mar 2014 05:32:00 -0700 (PDT)
Received: from localhost (95-91-232-83-dynip.superkabel.de. [95.91.232.83])
	by mx.google.com with ESMTPSA id jd2sm49976358wic.9.2014.03.25.05.31.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Mar 2014 05:31:58 -0700 (PDT)
Date: Tue, 25 Mar 2014 13:31:56 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Prasad Joshi <prasadjoshi.linux@gmail.com>
Message-ID: <20140325123156.GA28659@stefanha-thinkpad.redhat.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
	<1395566923-5074-6-git-send-email-prasadjoshi.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395566923-5074-6-git-send-email-prasadjoshi.linux@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::233
Cc: peter.maydell@linaro.org, aliguori@amazon.com, aik@ozlabs.ru,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, agraf@suse.de,
	v.maffione@gmail.com, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, av1474@comtv.ru, stefanha@redhat.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, alex@alex.org.uk,
	rizzo@iet.unipi.it, afaerber@suse.de, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 6/6] net: netmap_poll must
 update both read/write poll state
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
X-List-Received-Date: Tue, 25 Mar 2014 12:32:23 -0000

On Sun, Mar 23, 2014 at 02:58:43PM +0530, Prasad Joshi wrote:
> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
> ---
>  net/netmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my net tree:
https://github.com/stefanha/qemu/commits/net

Stefan

