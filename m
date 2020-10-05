Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPLm2-000788-Tn
	for mharc-qemu-trivial@gnu.org; Mon, 05 Oct 2020 04:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kPLm1-00076I-CZ
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 04:23:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kPLlz-0007EP-BW
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 04:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601886186;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VLIdSsN85IcUhOj40925EP+1CFySfhvhE18uzFCFpAk=;
 b=VShvYt7CI/3o8fBfsSThodHQ26eFtASfo2tEl0pT4AyPeOKYiy/yR9k2Oh6QOdul0Zs8FQ
 TlJ4rKyqyyC1VioMWOnNhhYASGMaD0crmrLro0f8q4r6s3PExQoRt2xnjV6R5O7/50KajZ
 Q0oPQLGXG11NVvZj7Bz5qQm5nCzMqJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-Eg9YeZzkP1yD_Nqi1H2rVA-1; Mon, 05 Oct 2020 04:23:02 -0400
X-MC-Unique: Eg9YeZzkP1yD_Nqi1H2rVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98EA4425CF;
 Mon,  5 Oct 2020 08:23:01 +0000 (UTC)
Received: from redhat.com (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C247BE44;
 Mon,  5 Oct 2020 08:22:56 +0000 (UTC)
Date: Mon, 5 Oct 2020 09:22:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v7 0/4] Fixes curses on msys2/mingw
Message-ID: <20201005082254.GE2385272@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20201002180838.2047-1-luoyonggang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201002180838.2047-1-luoyonggang@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 05 Oct 2020 08:23:09 -0000

Only one of the 4 patches in this series appears to have been sent.

On Sat, Oct 03, 2020 at 02:08:37AM +0800, Yonggang Luo wrote:
> V6-V7
> Update the configure script for
> * curses: Fixes compiler error that complain don't have langinfo.h on msys2/m=
> ingw
> 
> V5-V6
> Dropping configure: Fixes ncursesw detection under msys2/mingw by convert the=
> m to meson first.
> That need the meson 0.56 upstream to fixes the curses detection.
> Add
> * configure: fixes indent of $meson setup
> 
> Yonggang Luo (4):
>   configure: fixes indent of $meson setup
>   curses: Fixes compiler error that complain don't have langinfo.h on
>     msys2/mingw
>   curses: Fixes curses compiling errors.
>   win32: Simplify gmtime_r detection not depends on if  _POSIX_C_SOURCE
>     are defined on msys2/mingw
> 
>  configure                 | 47 +++++----------------------------------
>  include/sysemu/os-win32.h |  4 ++--
>  ui/curses.c               | 14 ++++++------
>  util/oslib-win32.c        |  4 ++--
>  4 files changed, 16 insertions(+), 53 deletions(-)
> 
> --=20
> 2.28.0.windows.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


