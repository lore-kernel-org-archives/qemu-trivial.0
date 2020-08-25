Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kAS3u-0005iH-9t
	for mharc-qemu-trivial@gnu.org; Tue, 25 Aug 2020 02:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kAS3t-0005hk-5Y
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 02:04:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kAS3r-0000tb-CW
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 02:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598335438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hileqYC8/RVBiqefMX381AkDKqA/jyGsHB4ewOii3gM=;
 b=D1Mh2Zb1WSwfs25WbQug29IBpUYaBcfhz4phuo5NWEfmXcW5GdCb6SocPxU0NzY7uJCJ0k
 XtUpElIwI3Eq2uJLKZg51RDpl3YdZKVCM/d+8IyJKnHNv7qTjvk4WiPnc2KPNL4bv4WntV
 psRjd01BbGeDfyOso59vtHIGjVBXlgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-mo40i8j7P02XhM-NjT_GzQ-1; Tue, 25 Aug 2020 02:03:55 -0400
X-MC-Unique: mo40i8j7P02XhM-NjT_GzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1683F801AEA;
 Tue, 25 Aug 2020 06:03:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-74.ams2.redhat.com
 [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA346100239B;
 Tue, 25 Aug 2020 06:03:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5CD34112D737; Tue, 25 Aug 2020 08:03:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Rohit Shinde <rohit.shinde12194@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mdroth@linux.vnet.ibm.com
Subject: Re: [PATCH v5] qapi/opts-visitor: Added missing fallthrough
 annotations
References: <20200818105021.4998-1-rohit.shinde12194@gmail.com>
Date: Tue, 25 Aug 2020 08:03:52 +0200
In-Reply-To: <20200818105021.4998-1-rohit.shinde12194@gmail.com> (Rohit
 Shinde's message of "Tue, 18 Aug 2020 06:50:21 -0400")
Message-ID: <87o8mzjm7r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 02:03:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Aug 2020 06:04:01 -0000

Rohit Shinde <rohit.shinde12194@gmail.com> writes:

> Added fallthrough comment on line 270 to prevent the compiler from
> throwing an error while compiling with the -Wimplicit-fallthrough flag

None of the compilers I know warns there.  Which one are you using?

Commit message style tip: use the imperative mood
https://chris.beams.io/posts/git-commit/#imperative

> Signed-off-by: Rohit Shinde <rohit.shinde12194@gmail.com>
> ---
>  qapi/opts-visitor.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
> index 7781c23a42..3422ff265e 100644
> --- a/qapi/opts-visitor.c
> +++ b/qapi/opts-visitor.c
> @@ -266,6 +266,7 @@ opts_next_list(Visitor *v, GenericList *tail, size_t size)
>          }
>          ov->list_mode = LM_IN_PROGRESS;
>          /* range has been completed, fall through in order to pop option */
> +        /* fallthrough */
>  
>      case LM_IN_PROGRESS: {
>          const QemuOpt *opt;


