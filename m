Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kFcxF-0000su-MH
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2020 08:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kFcxE-0000sV-IC
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 08:42:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kFcxC-0001AU-7Y
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 08:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599568949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83jq8UmXWwF2rJa5Qwpk/jya6EYo6XLLy2agS1z5tzk=;
 b=KK9l+BTigsndzoo6agbdqtW28O+ZVUIRapAA5qSpxudttIADkVBvPu+f4PiSevzACfRcnK
 X0l4p6tQV7qQZjv3RCE0PPWL24V+ggEICsCU4LhdB0YuEx9NFz7cY0zT5g67Dx9xlw40kz
 XLw4cFkW073wq+E5AvtubkG6qtyVm10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-y2qfvu-vORu2cigGCPNcVA-1; Tue, 08 Sep 2020 08:42:26 -0400
X-MC-Unique: y2qfvu-vORu2cigGCPNcVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C1F610082E5;
 Tue,  8 Sep 2020 12:42:25 +0000 (UTC)
Received: from [10.3.112.176] (ovpn-112-176.phx2.redhat.com [10.3.112.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED9035D9EF;
 Tue,  8 Sep 2020 12:42:24 +0000 (UTC)
Subject: Re: [PATCH v2] meson: Use -b to ignore CR vs. CR-LF issues on Windows
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20200907174828.1768-1-luoyonggang@gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4cd42e60-03c3-ced3-284f-bc6fad2780f0@redhat.com>
Date: Tue, 8 Sep 2020 07:42:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907174828.1768-1-luoyonggang@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.626, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 08 Sep 2020 12:42:32 -0000

On 9/7/20 12:48 PM, Yonggang Luo wrote:
> Or the tests result would cause following test failure:
> Running test QAPI doc
>    LINK    tests/check-qdict.exe
> --- C:/Users/ContainerAdministrator/AppData/Local/Temp/qemu-build/../cirrus-ci-build/tests/qapi-schema/doc-good.texi	2020-09-02 10:26:02.396028200 -0700
> +++ C:/Users/ContainerAdministrator/AppData/Local/Temp/qemu-build/tests/qapi-schema/doc-good-qapi-doc.texi	2020-09-02 10:43:09.849568200 -0700
> @@ -1,319 +1,319 @@
> -@c AUTOMATICALLY GENERATED, DO NOT MODIFY
> -

> -
> +@c AUTOMATICALLY GENERATED, DO NOT MODIFY

> +@end deftypefn
> +
> make: *** [Makefile.mtest:85: check-qapi-doc] Error 1
> make: *** Waiting for unfinished jobs....

> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   tests/qapi-schema/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Commit message is tooooo long compared to the body of the patch.  I'd 
suggest:

meson: Use -b to ignore CR vs. CR-LF issues on Windows

On windows, a difference in line endings causes testsuite failures 
complaining that every single line in files such as 
'tests/qapi-schemadoc-good.texi' is wrong.  Fix it by adding -b to diff.

> 
> diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
> index c87d141417..f1449298b0 100644
> --- a/tests/qapi-schema/meson.build
> +++ b/tests/qapi-schema/meson.build
> @@ -220,6 +220,6 @@ qapi_doc = custom_target('QAPI doc',
>   
>   # "full_path()" needed here to work around
>   # https://github.com/mesonbuild/meson/issues/7585
> -test('QAPI doc', diff, args: ['-u', files('doc-good.texi'), qapi_doc[0].full_path()],
> +test('QAPI doc', diff, args: ['-b', '-u', files('doc-good.texi'), qapi_doc[0].full_path()],

The change itself is sensible, once the commit message is fixed, so for 
v3, you can add:

Reviewed-by: Eric Blake <eblake@redhat.com>

>        depends: qapi_doc,
>        suite: ['qapi-schema', 'qapi-doc'])
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


