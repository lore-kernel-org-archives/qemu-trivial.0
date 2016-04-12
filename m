Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1apxiR-0000HO-8J
	for mharc-qemu-trivial@gnu.org; Tue, 12 Apr 2016 08:46:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1apxiO-0000Bx-Rk
	for qemu-trivial@nongnu.org; Tue, 12 Apr 2016 08:46:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1apxiL-0003kB-0I
	for qemu-trivial@nongnu.org; Tue, 12 Apr 2016 08:46:44 -0400
Received: from [59.151.112.132] (port=57281 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1apxiB-0003cU-A4; Tue, 12 Apr 2016 08:46:32 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5517721"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Apr 2016 20:46:08 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 21E26408D283;
	Tue, 12 Apr 2016 20:46:03 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 12 Apr 2016 20:46:02 +0800
To: Markus Armbruster <armbru@redhat.com>
References: <1458814461-5387-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<87mvp4xsbk.fsf@dusky.pond.sub.org> <570910D5.4030705@cn.fujitsu.com>
	<87a8kzkzlj.fsf@dusky.pond.sub.org>
CC: <qemu-trivial@nongnu.org>, <pbonzini@redhat.com>, <qemu-devel@nongnu.org>, 
	<peter.maydell@linaro.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <570CEEC0.3020501@cn.fujitsu.com>
Date: Tue, 12 Apr 2016 20:49:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87a8kzkzlj.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 21E26408D283.A4114
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev property: cleanup
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Apr 2016 12:46:45 -0000



On 04/12/2016 04:20 PM, Markus Armbruster wrote:

>
> Here's my try rewording the comment (sticking to GTK-Doc conventions
> even though I dislike them):
>
> /**
>   * @qdev_property_add_static:
>   * @dev: Device to add the property to
>   * @prop: The qdev property definition
>   * @err: location to store error information
>   *
>   * Add a static QOM property to @dev for qdev property @prop.
>   * On error, store error in @errp.
>   */
>
> Paolo, is it correct?
>
> Cao jin, is it an improvement?
>

Yes, better, save the unnecessary pains to analyse the property type for 
me:)

-- 
Yours Sincerely,

Cao jin



