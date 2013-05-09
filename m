Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UaL37-0003d9-KV
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2013 03:13:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UaL34-0003bC-0t
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:13:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UaL32-0001wu-74
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:13:53 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:48616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UaL31-0001wR-WC
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:13:52 -0400
Received: by mail-wi0-f176.google.com with SMTP id hq12so5847232wib.15
	for <qemu-trivial@nongnu.org>; Thu, 09 May 2013 00:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=9jcBkSCHCQTzw9uc1SzbUEg8Z85kIuGGbJrrXCS+3kk=;
	b=hb0OnOTRBSxP3X4iDkHCSlcdNSr2BiqPDfz8LnB7o7B0yKuoqD/IlspZbCEDfRwtYl
	TmQDNGFIGm0b3qVmXFTldWbuq/XOuHyKVPIs93cG4jPxcsjrrTIZ3oJuwOarJN/4YTfX
	20e38NM/VGRJZ5jpB2n4CurK57PbHRCk1/2dlzAX5PP53xpxtEqeqELL7QnLQZ3nxYC6
	GvCYPso+h/wisYm2lv2bTyxiiKUmfm4AYKZpGju/8x+07Ch6TLkPvGfSmrDRRCyNBf1G
	e9I5LxftFzHvQylhjXoVAMm/KIZk+l9fw1Xda03TquzFkvscbSF7bj+XO0W1RtDYjxTv
	TPAw==
X-Received: by 10.180.88.231 with SMTP id bj7mr26683825wib.5.1368083630744;
	Thu, 09 May 2013 00:13:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.63.18 with HTTP; Thu, 9 May 2013 00:13:30 -0700 (PDT)
In-Reply-To: <20130509070813.GA30653@arch.fnst.cn.fujitsu.com>
References: <1368006380-3125-1-git-send-email-trivial@linux.vnet.ibm.com>
	<1368006380-3125-2-git-send-email-trivial@linux.vnet.ibm.com>
	<518A4A2E.200@msgid.tls.msk.ru> <87vc6t61te.fsf@codemonkey.ws>
	<518B40CD.7030604@msgid.tls.msk.ru>
	<20130509070813.GA30653@arch.fnst.cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 May 2013 08:13:30 +0100
Message-ID: <CAFEAcA-tn8h08wjBkQudv-Da_Fp6CB68MLwy62x-tTkRkmpEww@mail.gmail.com>
To: Hu Tao <hutao@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQloPn+l+GvtImzHzfbV258Pt4dTKSre5LueYxJ5WLpfQsqBSj3VNM/AD2cRcW3PV8VlA9pR
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Trival <trivial@linux.vnet.ibm.com>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] remove needless
	semicolon
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
X-List-Received-Date: Thu, 09 May 2013 07:13:56 -0000

On 9 May 2013 08:08, Hu Tao <hutao@cn.fujitsu.com> wrote:
> On Thu, May 09, 2013 at 10:23:09AM +0400, Michael Tokarev wrote:
>> 08.05.2013 17:25, Anthony Liguori wrote:
>> > Michael Tokarev <mjt@tls.msk.ru> writes:
>> >
>> >> 08.05.2013 13:46, Trival wrote:
>> >>> Signed-off-by: Trival <trivial@linux.vnet.ibm.com>
>
> I think wdongxu probably wants HIS name and email go here. wdongxu, can
> you resend your patches with:
>
>   Signed-off-by: <your real name> <wdongxu@linux.vnet.ibm.com>
>
> ?

You should make sure you fix the From: line as well
as the Signed-off-by:, please.

thanks
-- PMM

