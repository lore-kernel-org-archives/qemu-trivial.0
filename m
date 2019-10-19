Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLpHe-0006Ru-Id
	for mharc-qemu-trivial@gnu.org; Sat, 19 Oct 2019 10:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1iLpHb-0006Qg-4z
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 10:00:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1iLpHW-0007DX-QS
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 10:00:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59822)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1iLpHW-0007Bn-H0
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 10:00:34 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1D5E5859FE
 for <qemu-trivial@nongnu.org>; Sat, 19 Oct 2019 14:00:32 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id k184so4076830wmk.1
 for <qemu-trivial@nongnu.org>; Sat, 19 Oct 2019 07:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KP3vwjUBEB84k8OE1O8olnCOg3vO9FYTOfM95m1nWOY=;
 b=oFUcTO8to9OsRvqb5oZNUAaBQ252QMvqzaejYiryB2BBrfs9CRBBStlaZ1FwPQylL7
 /RagliDGKc8ba//ro8DHkiYGETqypAbLcX6tRgQtCeNhH4jG55wsDwaQqHj0fQvPxUCu
 iKN170oX00QSdyjobZBJYaxMv5P0unNO0d1upegVq+0mhTf74DjZKS6yTKpYr/YBbWf6
 Oh9QYQqLKFaolbV1jYhJE2iWGWFfadANM2oq7kiGu8EWAe+WjewBUGsPwuejVzYnsOIw
 P6Y2JxmLd8SkNCo8dFMglkzkv2kyBwex8/D9znLuZqPYHNrFYFCkh9zKZdjNn3L2PK7F
 5c2g==
X-Gm-Message-State: APjAAAVKx1X35Bd4H5NvE69rQGBCdDCCDx0N5IyBxbSB6QuJGw31gQdW
 6i0rVq1CUTACWKHvssf7yFUaTc+aSwKjxiu8HbAp8WlYrfJdRfsGkDql7BZWOGnmeQy9NecExV9
 CzlePEhZayEVf9GmvjA==
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr12338749wmf.174.1571493630717; 
 Sat, 19 Oct 2019 07:00:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyV6qcwnkahEIWdsQ2Aqhq4hVfSdpKgV9ufvq3gfQC4GHf1PMG3zkzKP41gmyc3E9bkyT3n7w==
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr12338734wmf.174.1571493630437; 
 Sat, 19 Oct 2019 07:00:30 -0700 (PDT)
Received: from steredhat (host93-199-dynamic.52-79-r.retail.telecomitalia.it.
 [79.52.199.93])
 by smtp.gmail.com with ESMTPSA id z13sm9500067wrm.64.2019.10.19.07.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 07:00:29 -0700 (PDT)
Date: Sat, 19 Oct 2019 16:00:27 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, berrange@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] Do not use %m in common code to print error messages
Message-ID: <20191019140027.yzr6ccalmu6nmz53@steredhat>
References: <20191018130716.25438-1-thuth@redhat.com>
 <20191018134215.u6psfffrrxlsa2ns@steredhat>
 <1f36c112-fabb-df41-e01d-476e4c86186e@gmx.com>
 <f8fc0de2-b4b0-a75a-a00f-c6bca6914159@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8fc0de2-b4b0-a75a-a00f-c6bca6914159@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Oct 2019 14:00:41 -0000

On Fri, Oct 18, 2019 at 06:01:22PM +0200, Thomas Huth wrote:
> On 18/10/2019 15.49, Kamil Rytarowski wrote:
> > On 18.10.2019 15:42, Stefano Garzarella wrote:
> >> On Fri, Oct 18, 2019 at 03:07:16PM +0200, Thomas Huth wrote:
> >>> The %m format specifier is an extension from glibc - and when compiling
> >>> QEMU for NetBSD, the compiler correctly complains, e.g.:
> >>>
> >>> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c: In function 'sigfd_handler':
> >>> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c:64:13: warning: %m is only
> >>>  allowed in syslog(3) like functions [-Wformat=]
> >>>              printf("read from sigfd returned %zd: %m\n", len);
> >>>              ^
> >>> Let's use g_strerror() here instead, which is an easy-to-use wrapper
> >>> around the thread-safe strerror_r() function.
> >>>
> >>> While we're at it, also convert the "printf()" in main-loop.c into
> >>> the preferred "error_report()".
> >>>
> >>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >>> ---
> >>>  v2: Do not try to g_free() the strings
> >>>
> >>>  hw/misc/tmp421.c | 4 ++--
> >>>  util/main-loop.c | 3 ++-
> >>>  util/systemd.c   | 4 ++--
> >>>  3 files changed, 6 insertions(+), 5 deletions(-)
> >>
> >> There are many uses of %m also in hw/vfio/ but that's Linux stuff.
> >> Should we change those too or it doesn't matter since it never really
> >> compiled on NetBSD?
> > 
> > It's a gnu (glibc) extension and linux can use alternative libc
> > implementations. Probably most of them capable to host qemu use %m.
> 
> I think I read somewhere that other libcs on Linux also support %m (like

Good to know!

> musl), but I just can't find that reference anymore. Anyway, we can
> still fix that later in case someone hits the issue.
> 

Yes, make sense to me.

Thanks,
Stefano

