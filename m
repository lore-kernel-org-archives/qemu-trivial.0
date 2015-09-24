Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfEIo-0003bl-SS
	for mharc-qemu-trivial@gnu.org; Thu, 24 Sep 2015 17:43:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jiri@resnulli.us>) id 1ZfBZ1-0007VX-0s
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 14:48:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jiri@resnulli.us>) id 1ZfBYw-0006Rz-1f
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 14:48:14 -0400
Received: from mail-wi0-f178.google.com ([209.85.212.178]:34327)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jiri@resnulli.us>) id 1ZfBYv-0006Ra-SS
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 14:48:09 -0400
Received: by wicfx3 with SMTP id fx3so41039578wic.1
	for <qemu-trivial@nongnu.org>; Thu, 24 Sep 2015 11:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=3IMMF45wJGsAqVSYbee2+WLnr6kVvx+R5Bz2nmUIFZ4=;
	b=Lrc7YBhvryxs626PxNYnnZu1gjDqxcSJdzsv/WAkgcmpzrC/qdACqMsD10SU5xao3X
	tKGNwf266m1jvecO38UVT7Tkiqh7ba6o7OX/9NNc5m3E2Ve7t3sjWRktNhzyw3uuf9rA
	iqV/5c46yau1OuC69tWEipO6BmPIygMvSyVwc1S9xgwtbD7NPGQIHTKt8jtj5lZUPoNs
	thge5GREj0y0/4EMtsFu5Y7rennPKw8yqCkmwXc1k4nKhHBUy6mSTfh70cnTPkUqMc5a
	Tf2rZognXUu0/4zjClhJXuZbZ0+WegZXQsMGeoq9YVicypoQZZaX5emmC1i+iPu7VGC/
	RcVA==
X-Gm-Message-State: ALoCoQnRUTgMhblkIHEQ0cB7fxfaufpJsHwxsZ8Ygcm/TkpInJk59HB3KJpPS+q7UDEazDRavC1W
X-Received: by 10.181.13.241 with SMTP id fb17mr1945254wid.45.1443120488842;
	Thu, 24 Sep 2015 11:48:08 -0700 (PDT)
Received: from localhost ([2001:470:6f:505:6af7:28ff:fe89:d4d1])
	by smtp.gmail.com with ESMTPSA id
	lm3sm13520129wjc.39.2015.09.24.11.48.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Sep 2015 11:48:08 -0700 (PDT)
Date: Thu, 24 Sep 2015 20:48:07 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20150924184807.GA2123@nanopsycho.orion>
References: <1442231543-23446-1-git-send-email-armbru@redhat.com>
	<87oagrbxjw.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87oagrbxjw.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.178
X-Mailman-Approved-At: Thu, 24 Sep 2015 17:43:41 -0400
Cc: qemu-trivial@nongnu.org, sfeldma@gmail.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] rocker: Use g_new() & friends where that
 makes obvious sense
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
X-List-Received-Date: Thu, 24 Sep 2015 18:48:18 -0000

Thu, Sep 24, 2015 at 06:18:43PM CEST, armbru@redhat.com wrote:
>Michael, could you take this one through trivial?  Assuming Scott and
>Jiri don't mind, and with s/patchas/patch as/ in the commit message.

I don't mind :)

