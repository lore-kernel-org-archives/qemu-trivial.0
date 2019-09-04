Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i5KqW-0006Pc-OS
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2019 22:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40553)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1i5KqU-0006O2-AQ
 for qemu-trivial@nongnu.org; Tue, 03 Sep 2019 22:16:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1i5KqO-00088z-J4
 for qemu-trivial@nongnu.org; Tue, 03 Sep 2019 22:16:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48580)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1i5KqI-00085X-6G
 for qemu-trivial@nongnu.org; Tue, 03 Sep 2019 22:16:18 -0400
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 16ADD64127
 for <qemu-trivial@nongnu.org>; Wed,  4 Sep 2019 02:16:16 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id b23so10938410pls.8
 for <qemu-trivial@nongnu.org>; Tue, 03 Sep 2019 19:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LczehYJriNMVPyBcXcSRQNzVxF3xXTD0Ti3R2yiPpDY=;
 b=oRVrjFkigY89VHnxbE/G7SQybzSuX5b3avTtSnaeCvpMVBuysMWqKTO0jCJRNQHVJT
 yOTAlJhBMv0wl1bdd53jCY2Oji08hT0llh3ZXZyPwWNUnSgIlG9yzQBsPlvK/f7CK4e4
 PgIpiHL73Rg8DvCAogPNtNAChc4TQ95lFzTcfkWnYXpHLQU2VObahHbj6/LiyJm6Mwnh
 nExJXgww5BVW6uWMYl5VdMbpy4nwc4Sy6zEZZ6NNSPBjEnntdn7LWc2Oct3F+Mt/2J24
 XvnAaNPntPFKGTdX6Bx6UT7EtyWUUwVVK64WjulFhRbYeRQxonGhahJhPKkwWqijO1Dp
 nq9Q==
X-Gm-Message-State: APjAAAXitoAYlntn+uVq24nCOyOnJ7Y0IGXHBFIWh4fwJX1Zsuwv9gjf
 Dny06toJk/GJPX+J/TpzYNvDodtQFe9ftHSQXLELKdfw3lvEN0rQUjaDe+acusD97jgJWn8uOeB
 fNI/dCKRHviKXXpqJow==
X-Received: by 2002:a17:90a:c386:: with SMTP id
 h6mr2490054pjt.122.1567563375575; 
 Tue, 03 Sep 2019 19:16:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4+b2xmgNn8cn709RXMhSigvaxqkBQWmtcSVTB48MZEdD9fyVEhF7/8oAnKdBrZYv1Bk4zVQ==
X-Received: by 2002:a17:90a:c386:: with SMTP id
 h6mr2490040pjt.122.1567563375370; 
 Tue, 03 Sep 2019 19:16:15 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f27sm16778884pgm.60.2019.09.03.19.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 19:16:14 -0700 (PDT)
Date: Wed, 4 Sep 2019 10:16:03 +0800
From: Peter Xu <peterx@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Max Reitz <mreitz@redhat.com>
Message-ID: <20190904021603.GD30402@xz-x1>
References: <20190903120555.7551-1-philmd@redhat.com>
 <6aca73a4-1567-4952-14eb-ecd3c115acad@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6aca73a4-1567-4952-14eb-ecd3c115acad@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] cutils: Move size_to_str()
 from "qemu-common.h" to "qemu/cutils.h"
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
X-List-Received-Date: Wed, 04 Sep 2019 02:16:31 -0000

On Tue, Sep 03, 2019 at 02:57:31PM -0400, John Snow wrote:

[...]

> Seems proper. It must be an oversight to begin with that we declared it
> in qemu-common but defined it in cutils.

Porbably true..

> 
> Reviewed-by: John Snow <jsnow@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu

