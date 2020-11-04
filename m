Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kaJf1-0005CJ-Nz
	for mharc-qemu-trivial@gnu.org; Wed, 04 Nov 2020 09:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kaJf0-0005B7-Pj
 for qemu-trivial@nongnu.org; Wed, 04 Nov 2020 09:21:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kaJex-0007oL-O9
 for qemu-trivial@nongnu.org; Wed, 04 Nov 2020 09:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604499670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGbQhz5oeO/fDS3H5K9to3mCQbm/xwezZXB5Mx1byYs=;
 b=LXRc543wjmp9nPADxC23BM5ChO5C7lCjKt2suSsTdgw6FT43S4Ns08+wE+6xLiC+ePmvgV
 aW/cBOFwgAbGAGjsfeD8JE9IGaraa5eA2ZWgtxOZch0ZyWPeecpaIfIXDm6J3VGcCuid26
 MDzq7kphWz2CdGv60cn7RfYWlvGJAWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-JanRb7PXMp2_jmDDqE1rdg-1; Wed, 04 Nov 2020 09:21:07 -0500
X-MC-Unique: JanRb7PXMp2_jmDDqE1rdg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F138B18C9F55;
 Wed,  4 Nov 2020 14:21:05 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-151.ams2.redhat.com [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BBF37EEC9;
 Wed,  4 Nov 2020 14:21:00 +0000 (UTC)
Subject: Re: [PATCH] Prefer 'on' | 'off' over 'yes' | 'no' for bool options
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20201104140528.608015-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c9251f48-c535-e618-b826-1ba0503ff6f1@redhat.com>
Date: Wed, 4 Nov 2020 15:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201104140528.608015-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 04 Nov 2020 14:21:15 -0000

On 04/11/2020 15.05, Daniel P. Berrangé wrote:
> Update some docs and test cases to use 'on' | 'off' as the preferred
> value for bool options.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/system/vnc-security.rst | 6 +++---
>  include/authz/listfile.h     | 2 +-
>  qemu-options.hx              | 4 ++--
>  tests/qemu-iotests/233       | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/system/vnc-security.rst b/docs/system/vnc-security.rst
> index b237b07330..e97b42dfdc 100644
> --- a/docs/system/vnc-security.rst
> +++ b/docs/system/vnc-security.rst
> @@ -89,7 +89,7 @@ but with ``verify-peer`` set to ``yes`` instead.
>  .. parsed-literal::
>  
>     |qemu_system| [...OPTIONS...] \
> -     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=yes \
> +     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=on \
>       -vnc :1,tls-creds=tls0 -monitor stdio
>  
>  .. _vnc_005fsec_005fcertificate_005fpw:
> @@ -103,7 +103,7 @@ authentication to provide two layers of authentication for clients.
>  .. parsed-literal::
>  
>     |qemu_system| [...OPTIONS...] \
> -     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=yes \
> +     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=on \
>       -vnc :1,tls-creds=tls0,password -monitor stdio
>     (qemu) change vnc password
>     Password: ********
> @@ -145,7 +145,7 @@ x509 options:
>  .. parsed-literal::
>  
>     |qemu_system| [...OPTIONS...] \
> -     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=yes \
> +     -object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=on \
>       -vnc :1,tls-creds=tls0,sasl -monitor stdio
>  
>  .. _vnc_005fsetup_005fsasl:
> diff --git a/include/authz/listfile.h b/include/authz/listfile.h
> index 0a1e5bddd3..0b7fe72198 100644
> --- a/include/authz/listfile.h
> +++ b/include/authz/listfile.h
> @@ -73,7 +73,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(QAuthZListFile,
>   * The object can be created on the command line using
>   *
>   *   -object authz-list-file,id=authz0,\
> - *           filename=/etc/qemu/myvm-vnc.acl,refresh=yes
> + *           filename=/etc/qemu/myvm-vnc.acl,refresh=on
>   *
>   */
>  struct QAuthZListFile {
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 2c83390504..0bdc07bc47 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -5002,7 +5002,7 @@ SRST
>          Note the use of quotes due to the x509 distinguished name
>          containing whitespace, and escaping of ','.
>  
> -    ``-object authz-listfile,id=id,filename=path,refresh=yes|no``
> +    ``-object authz-listfile,id=id,filename=path,refresh=on|off``
>          Create an authorization object that will control access to
>          network services.
>  
> @@ -5047,7 +5047,7 @@ SRST
>  
>               # |qemu_system| \\
>                   ... \\
> -                 -object authz-simple,id=auth0,filename=/etc/qemu/vnc-sasl.acl,refresh=yes \\
> +                 -object authz-simple,id=auth0,filename=/etc/qemu/vnc-sasl.acl,refresh=on \\
>                   ...
>  
>      ``-object authz-pam,id=id,service=string``
> diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
> index a5c17c3963..0b99530f7f 100755
> --- a/tests/qemu-iotests/233
> +++ b/tests/qemu-iotests/233
> @@ -83,7 +83,7 @@ echo
>  echo "== check plain client to TLS server fails =="
>  
>  nbd_server_start_tcp_socket \
> -    --object tls-creds-x509,dir=${tls_dir}/server1,endpoint=server,id=tls0,verify-peer=yes \
> +    --object tls-creds-x509,dir=${tls_dir}/server1,endpoint=server,id=tls0,verify-peer=on \
>      --tls-creds tls0 \
>      -f $IMGFMT "$TEST_IMG" 2>> "$TEST_DIR/server.log"
>  
> @@ -128,7 +128,7 @@ echo "== check TLS with authorization =="
>  nbd_server_stop
>  
>  nbd_server_start_tcp_socket \
> -    --object tls-creds-x509,dir=${tls_dir}/server1,endpoint=server,id=tls0,verify-peer=yes \
> +    --object tls-creds-x509,dir=${tls_dir}/server1,endpoint=server,id=tls0,verify-peer=on \
>      --object "authz-simple,id=authz0,identity=CN=localhost,, \
>        O=Cthulu Dark Lord Enterprises client1,,L=R'lyeh,,C=South Pacific" \
>      --tls-authz authz0 \
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


