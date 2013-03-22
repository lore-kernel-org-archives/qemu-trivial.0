Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UJ3NV-00068I-BR
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 10:55:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ3NR-00066e-Lb
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 10:55:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ3NK-0002T3-Oj
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 10:55:29 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:41070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UJ3NK-0002Sg-EC; Fri, 22 Mar 2013 10:55:22 -0400
Received: by mail-wi0-f173.google.com with SMTP id hq4so7921097wib.12
	for <multiple recipients>; Fri, 22 Mar 2013 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=sOBq8MhAcwodMlDzDIvDJSgDmVs0HgZBZayTSe9jqms=;
	b=v7XeG7bYARrfW+I0nYwch0sbr5wBnNdir0L15qTG04sAuXJo3gBj3Ln2M36Kv3mkUB
	w5T5VdsJXZ6nW2Zkso9fmiwJag8CoPD7JATlvPoNWxPV0Pnqhi6DPEAJNwNsdnrZWjnl
	PpCxFT3j2QbZZj3iqVHDM88GY8OEtZ4+KFX6hX1UML4lXALDi3d4G9rV1wIhAeUAFsPZ
	yO2phKdVeRfAkyh+QKcWHQurBnm45TUEQKCJkUtDktZUmWH5h7QdLBGe4tJeu7S6D1Ry
	A6/AFXUqk+NIM8voLr673KY5SRwFH7jTZJ9AGk0vKPpemoG3qUFQU/IDFX7ICDUTrbxn
	ENiA==
X-Received: by 10.194.158.161 with SMTP id wv1mr3668871wjb.38.1363964121394;
	Fri, 22 Mar 2013 07:55:21 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:81b0:6069:490c:9a88])
	by mx.google.com with ESMTPS id fb8sm4069927wid.1.2013.03.22.07.55.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 07:55:20 -0700 (PDT)
Date: Fri, 22 Mar 2013 15:55:18 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20130322145518.GA948@stefanha-thinkpad.redhat.com>
References: <20130320034208.GA29514@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130320034208.GA29514@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3] Use proper term in TCG README
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
X-List-Received-Date: Fri, 22 Mar 2013 14:55:31 -0000

On Wed, Mar 20, 2013 at 11:42:08AM +0800, 陳韋任 (Wei-Ren Chen) wrote:
>   In TCG, "target" means the host architecture for which TCG generates
> the code. Using "guest" rather than "target" to make the document more
> consistent.
> 
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
> v3: Adopt Peter's suggestion on sentence and typo.
> 
> v2: Correct all wrong usage of the term "target" in this document.
>   
> 
>  tcg/README | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

