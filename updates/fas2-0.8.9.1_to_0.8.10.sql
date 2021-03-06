-- Copyright © 2013  Pierre-Yves Chibon
--
-- This copyrighted material is made available to anyone wishing to use, modify,
-- copy, or redistribute it subject to the terms and conditions of the GNU
-- General Public License v.2.  This program is distributed in the hope that it
-- will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-- implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-- See the GNU General Public License for more details.  You should have
-- received a copy of the GNU General Public License along with this program;
-- if not, write to the Free Software Foundation, Inc., 51 Franklin Street,
-- Fifth Floor, Boston, MA 02110-1301, USA. Any Red Hat trademarks that are
-- incorporated in the source code or documentation are not subject to the GNU
-- General Public License and may only be used or replicated with the express
-- permission of Red Hat, Inc.
--
-- Author(s): Pierre-Yves Chibon

-- Update the group.group_type to include the type 'pkgdb'.

-- Here we assume the name is 'groups_group_type_check' -- Might have to be
-- checked as we did not name the constraint.
ALTER TABLE groups
DROP CONSTRAINT groups_group_type_check;

-- Set the name of the new constraint.
ALTER TABLE groups
ADD CONSTRAINT groups_group_type_check CHECK (group_type in ('cla', 'system',
    'bugzilla','cvs', 'bzr', 'git', 'hg', 'mtn', 'svn', 'shell', 'torrent',
    'tracker', 'tracking', 'user', 'pkgdb'));

