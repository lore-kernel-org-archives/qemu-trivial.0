Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WSQXM-0007q1-JW
	for mharc-qemu-trivial@gnu.org; Tue, 25 Mar 2014 08:33:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WSQXE-0007T4-Uw
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 08:32:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WSQX9-0004pO-A7
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 08:32:52 -0400
Received: from mail-we0-x229.google.com ([2a00:1450:400c:c03::229]:62352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1WSQWy-0004c4-Df; Tue, 25 Mar 2014 08:32:36 -0400
Received: by mail-we0-f169.google.com with SMTP id w62so274144wes.0
	for <multiple recipients>; Tue, 25 Mar 2014 05:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h4rmapYpM0XhLgU7GM9BdH4sdGPfdBCT+JNPpFCJhU0=;
	b=EvfDdXyPgzFZ+TwS7YgbTwagKIsRhef0Bpd62RVQnC7nI5KY1jeBzDJ0vB5tJjvONu
	FKnmFn0sz0PB94yGu8Ek/k1r/CvnNermbPlEBJDC2cnnhEKloBbqR0oIXrGcaBzJy1hn
	KWHbkO1KRvdRj/ajVanvsWT/I12tkAYADtPxq9CT4ZmIngfSy4mgJ3bnSvSm8Qqxh2+Q
	1fkeeBB/tI+QRumdFdMI/z3oD90dOGySTxOn3kwQ4me9L9OtGI6W8WDcke7V76QsHTJs
	W0ytPo4N4Jw5JkQ72we9879kyKgZWdnLm7OyVgkRnA9Gr4lAL8T50iQ8Sq4DX+haj+GO
	kZcA==
X-Received: by 10.180.101.230 with SMTP id fj6mr22992115wib.27.1395750755392; 
	Tue, 25 Mar 2014 05:32:35 -0700 (PDT)
Received: from localhost (95-91-232-83-dynip.superkabel.de. [95.91.232.83])
	by mx.google.com with ESMTPSA id r1sm49851857wia.5.2014.03.25.05.32.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Mar 2014 05:32:34 -0700 (PDT)
Date: Tue, 25 Mar 2014 13:32:31 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Prasad Joshi <prasadjoshi.linux@gmail.com>
Message-ID: <20140325123231.GB28659@stefanha-thinkpad.redhat.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
	<1395566923-5074-3-git-send-email-prasadjoshi.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395566923-5074-3-git-send-email-prasadjoshi.linux@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::229
Cc: peter.maydell@linaro.org, aliguori@amazon.com, aik@ozlabs.ru,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, agraf@suse.de,
	v.maffione@gmail.com, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, av1474@comtv.ru, stefanha@redhat.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, alex@alex.org.uk,
	rizzo@iet.unipi.it, afaerber@suse.de, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/6] pcnet: remove duplicate
	assignment
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
X-List-Received-Date: Tue, 25 Mar 2014 12:32:58 -0000

On Sun, Mar 23, 2014 at 02:58:40PM +0530, Prasad Joshi wrote:
> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
> ---
>  hw/net/pcnet.c | 1 -
>  1 file changed, 1 deletion(-)

Thanks, applied to my net-next tree:
https://github.com/stefanha/qemu/commits/net-next

Stefan

