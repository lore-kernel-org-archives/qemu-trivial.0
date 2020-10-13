Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSKR6-0005kP-1V
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 09:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kSKR4-0005hN-J3
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 09:33:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kSKR2-0001st-A5
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 09:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602596027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r0BP+gQqKln20CsI1CX4LB5dICD1Ue1fbnsy7cjJaAs=;
 b=N+FZTE/ba7wHQuBMEpCof6yqBnI2qKpS7cCFvpWXwVF8SdDGeBHGjuFmeRcEPkjESF6aLi
 EoBG/gZXmlPH7OZ6T+0Jh6TdXHcjKn+CT4DbnsmZgFY22iLCCE7+q8AjF8hYQw0fJDH+5q
 kt9ewIL0lxyZpfYHyV7P4PqkB0zPegU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-zrn7wZtlO5elQGKDf5torg-1; Tue, 13 Oct 2020 09:33:43 -0400
X-MC-Unique: zrn7wZtlO5elQGKDf5torg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DD06876E3B;
 Tue, 13 Oct 2020 13:33:42 +0000 (UTC)
Received: from work-vm (ovpn-114-238.ams2.redhat.com [10.36.114.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80E0160C0F;
 Tue, 13 Oct 2020 13:33:40 +0000 (UTC)
Date: Tue, 13 Oct 2020 14:33:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, quintela@redhat.com,
 alex.chen@huawei.com, wanghao232@huawei.com, zhengchuan@huawei.com
Subject: Re: [PATCH v2 4/8] migration: Open brace '{' following struct go on
 the same line
Message-ID: <20201013133337.GD2920@work-vm>
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-5-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1602508140-11372-5-git-send-email-yubihong@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 03:04:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 13 Oct 2020 13:33:50 -0000

* Bihong Yu (yubihong@huawei.com) wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>

Yes, I think that line probably predates the coding standard :-)


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/migration/migration.h b/migration/migration.h
> index deb411a..99784b4 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -124,8 +124,7 @@ struct MigrationClass {
>      DeviceClass parent_class;
>  };
>  
> -struct MigrationState
> -{
> +struct MigrationState {
>      /*< private >*/
>      DeviceState parent_obj;
>  
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


