Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kHAuN-00075a-FJ
	for mharc-qemu-trivial@gnu.org; Sat, 12 Sep 2020 15:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carpeddiem@gmail.com>)
 id 1kHAuL-00075G-S3; Sat, 12 Sep 2020 15:09:57 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carpeddiem@gmail.com>)
 id 1kHAuK-0005hJ-3H; Sat, 12 Sep 2020 15:09:57 -0400
Received: by mail-io1-f68.google.com with SMTP id z25so14537849iol.10;
 Sat, 12 Sep 2020 12:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H3PuVkyaq8STT91gpAHe0+XPst1XNcG9Sdb03z0auds=;
 b=nA3r51+2D7oJz+hOJehBUmwqiLkt+NaDtIkothwLKvGRz75/bqxRiH5cGst6QxDIn7
 dSX/V/uDZmILFgrg/dp4TAW+XTWIUjjAb235jp0ZAY6XgoeDLIetCOX3DCha9DSLdl9T
 LyObIh+sMTmdY7/sUZ31iqFn4uTRb5O1Z6ZTJq8grj0vNEROrYonPTZRAfOAnROfd48d
 ou51FvkgwSMTjknLRVJ8jfSPpslrD1y3utEGJSL9BE89WkMw7hSINPyjERNoAa+1UI8J
 JnYJAmAXbKYoFEqY922dqzez161pWHtj5Yf0QhxKKq0qoxkUlN6+bDG83j/wVq1WMVzz
 Q7WA==
X-Gm-Message-State: AOAM530my1CxoWfi9h+Dz0RGke+gRUMyA745jK6dV0PGHXbp7bLy/Qqh
 cTRqg9u0hDLUiICF3rrgmhno0BWOOW/Pa2UTFE+xXuM5fO0=
X-Google-Smtp-Source: ABdhPJzhZVWPDbxYg07KBSJA0KOGdEYWGERGWQS6CW4SaFcHMaD8ZHFiQA0rdjhIGb3zKodefU9aYvv/TggpCWULDWU=
X-Received: by 2002:a02:a615:: with SMTP id c21mr6504223jam.106.1599937793862; 
 Sat, 12 Sep 2020 12:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200912114040.918464-1-f4bug@amsat.org>
 <159991113647.32613.1847386236215843361@66eaa9a8a123>
In-Reply-To: <159991113647.32613.1847386236215843361@66eaa9a8a123>
From: Ed Maste <emaste@freebsd.org>
Date: Sat, 12 Sep 2020 15:09:41 -0400
Message-ID: <CAPyFy2B5tfc+j9kw9YafBdNP6m80pG2cGRtUSQTLkeX1GxfGkw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] hw/char/serial: Housekeeping
To: qemu-devel <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.68; envelope-from=carpeddiem@gmail.com;
 helo=mail-io1-f68.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 15:09:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sat, 12 Sep 2020 19:09:58 -0000

On Sat, 12 Sep 2020 at 07:46, <no-reply@patchew.org> wrote:
>
> Patchew URL: https://patchew.org/QEMU/20200912114040.918464-1-f4bug@amsat.org/
>
> Hi,
>
> This series failed build test on FreeBSD host. Please find the details below.
>
> The full log is available at
> http://patchew.org/logs/20200912114040.918464-1-f4bug@amsat.org/testing.FreeBSD/?type=message.

Looks like a full disk:

Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
From https://github.com/patchew-project/qemu
 - [tag update]      patchew/20200912114040.918464-1-f4bug@amsat.org
-> patchew/20200912114040.918464-1-f4bug@amsat.org
error: copy-fd: write returned No space left on device
fatal: failed to copy file to
'/var/tmp/patchew-tester-tmp-b6phottt/src/.git/objects/pack/pack-7bdf4f5a855cab7e92327c9c14876dca81c24a36.pack':
No space left on device
fatal: The remote end hung up unexpectedly

