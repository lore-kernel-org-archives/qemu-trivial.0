Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kFaSS-0006OE-5x
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2020 06:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFaSQ-0006NW-Ot
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 06:02:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25409
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFaSP-0005Tz-2i
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 06:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599559352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cV+ZJMROYZG50DpmZo7CSvA2V/Nw/T84LzXM0bcGhPI=;
 b=MCpXdv6+C/jbCK+lPB31xS49kn13z/K6YQwSprjkj1ANwYp4/My5w2MuEIRk0k+k6igZ2f
 AT126g4nabWgvod0h+JJncwoKOyhNz5184hwfgFhZKhQODOW54dheaCdbo9RaEaqCj9CcY
 c27Q4FqB4LPCoNr59xUULcSJC63djUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-M8LS-mQ0P8quhH-SsQ2gOQ-1; Tue, 08 Sep 2020 06:02:30 -0400
X-MC-Unique: M8LS-mQ0P8quhH-SsQ2gOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A84E1801AE4;
 Tue,  8 Sep 2020 10:02:29 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-122.ams2.redhat.com
 [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE2EB7D8AE;
 Tue,  8 Sep 2020 10:02:25 +0000 (UTC)
Subject: Re: [PATCH v2] scripts/git.orderfile: Display meson files along with
 buildsys ones
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200907161222.41915-1-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <bd658d44-d9bd-81d1-f3c7-89c0d61f6dd2@redhat.com>
Date: Tue, 8 Sep 2020 12:02:24 +0200
MIME-Version: 1.0
In-Reply-To: <20200907161222.41915-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 00:33:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 08 Sep 2020 10:02:34 -0000

On 09/07/20 18:12, Philippe Mathieu-Daudé wrote:
> Since commit a56650518f5 ("configure: integrate Meson in the build
> system") we replaced many Makefile by Meson files. Adapt the
> git.orderfile script to display the new file at the same position.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  scripts/git.orderfile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index 73fd818d7f3..a021afc2d51 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -18,6 +18,7 @@ docs/*
>  configure
>  Makefile*
>  *.mak
> +meson.build
>  
>  # qapi schema
>  qapi/*.json
> 

Possibly related (not sure if there's another patch pending for it
already): if you run a "make clean" in the source tree, and have the
Meson submodule initialized, the "make clean" will delete files from the
Meson submodule.

find . \( -name '*.so' -o -name '*.dll' -o -name '*.[oda]' \) -type f \

"*.d" matches various meson files.

(Again, apologies if this is already known; I understand this is
probably the worst context to report his in...)

Thanks
Laszlo


