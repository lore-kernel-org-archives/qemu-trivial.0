Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKBFk-0000Vi-8H
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 14:04:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VKBFd-0000Oi-VU
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:04:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VKBFZ-0008Am-AU
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:04:21 -0400
Received: from mail-lb0-f181.google.com ([209.85.217.181]:47517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VKBFZ-0008AY-3t
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:04:17 -0400
Received: by mail-lb0-f181.google.com with SMTP id u14so1186952lbd.26
	for <qemu-trivial@nongnu.org>; Thu, 12 Sep 2013 11:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AnblbrYZMJqUByKWHGu10EJqtCEVIqzE5igYJCAQ7qg=;
	b=ShyxBkbKR+4bT+MESHnEp3zop3RaJs0gitD4LzM5zpgDUfzAfFvGkqgCNBNcbHrR1J
	tVTkqmiWo/vWBzsYwbXc1lg9t3FGyqaNE8CP4ZE51P9xJlzsSJRybardy4Muln6IADxq
	bptLhWug2qAqXoF40aX6IVN0WsUeUqXPGe6zRHhTYc6McOIAwwE0CnNcD7xsitQRZqS3
	qsAXBH5fTU7tag2FBVpE3XLiyWpYamx0SdLxNvaH3SUw7Qx3gh6yxROhc5/Qs9XFUMLA
	NY2hNbHMyCX/hDLP0DjfdSRpGClo5q96PIXGwcGd5bkGx/yXzHQtSzTZCsoteEobSOHD
	G8Hg==
X-Gm-Message-State: ALoCoQmz1SQdVK5OSebQAZADbikUrhD0wMCPb0gMyY9nTWJGQ+9eoZLqDrRlp4hlBIwmln5TEG/4
X-Received: by 10.152.116.109 with SMTP id jv13mr2805289lab.30.1379009056144; 
	Thu, 12 Sep 2013 11:04:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Thu, 12 Sep 2013 11:03:55 -0700 (PDT)
In-Reply-To: <1379008661-17878-1-git-send-email-sw@weilnetz.de>
References: <1379008661-17878-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2013 19:03:55 +0100
Message-ID: <CAFEAcA-i=aw7wXVuU7u769gnHHTYryb0n=BVE0ayROk5W=a18Q@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.181
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] *-user: Fix typo in comment
	(ulocking -> unlocking)
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
X-List-Received-Date: Thu, 12 Sep 2013 18:04:26 -0000

On 12 September 2013 18:57, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

